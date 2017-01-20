require 'sinatra'
require 'sinatra/reloader' if development?
require 'tilt/erubis'
require 'redcarpet'

configure do
  enable :sessions
  set :session_secret, 'ha'
end

def data_path
  root = File.expand_path('..', __FILE__)
  if ENV['RACK_ENV'] == 'test'
    File.join(root, 'test', 'data')
  else
    File.join(root, 'data')
  end
end

helpers do
  def shortname(full_filename)
    File.basename(full_filename)
  end
end

before do
  file_paths = File.join(data_path, '*')
  @files = Dir.glob(file_paths)
end


# view index page
get '/' do
  erb :index
end

# view new document page
get '/new' do
  erb :new
end

def valid_name?(name)
  !(File.exist?(name) || name.empty? || File.extname(name).empty?)
end

# create new document
post '/new' do
  file_path = File.join(data_path, params[:filename])

  unless valid_name?(file_path)
    session[:message] = "A unique name with extension is required!"
    redirect '/new'
  end

  File.new(file_path, 'w')
  redirect '/'
end

# delete document
post '/:filename/delete' do
  file_path = File.join(data_path, params[:filename])

  File.delete(file_path)
  session[:message] = "#{params[:filename]} was deleted."
  redirect '/'
end

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

def load_content(path)
  content = File.read(path)

  case File.extname(path)
  when '.txt'
    headers['Content-Type'] = 'text/plain'
    content
  when '.md'
    erb :document, :locals => { :text => render_markdown(content) }
  end
end

# view individual document page
get '/:filename' do
  filename = params[:filename] # extract 2 lines to a method?
  file_path = File.join(data_path, filename)

  unless File.exist?(file_path)
    session[:message] = "'#{filename}' does not exist."
    redirect '/'
  end

  load_content(file_path)
end

# view document editing page
get '/:filename/edit' do
  filename = params[:filename] #extract 2 lines to a method?
  file_path = File.join(data_path, filename)

  @document = File.read(file_path)
  erb :edit
end

post '/:filename/edit' do
  filename = params[:filename] #extract 2 lines to a method?
  file_path = File.join(data_path, filename)

  File.open(file_path, 'w') do |file|
    file.write(params[:edited_text])
  end

  session[:message] = "'#{params[:filename]}' has been edited!"
  redirect '/'
end
