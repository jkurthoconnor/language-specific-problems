require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'redcarpet'


configure do
  enable :sessions
  set :session_secret, 'mickey mouse'
end


helpers do
  def clean_filename(filename) # input e.g.: "/Users/oconnor/dropbox/coding/lsch/crs170/file_cms/data/about.txt"
  File.basename(filename) # output: "about.txt"
  end
end

def data_path
  if ENV['RACK_ENV'] == 'test'
    File.expand_path('../test/data', __FILE__)
  else
    File.expand_path('../data', __FILE__)   # e.g.: => "/home/jko/coding/lsch/crs170/file_cms/data"
  end
end


get '/' do
  pattern = File.join(data_path, '*') # returns new string, with arguments joined by File::SEPARATOR ('/' or '\' based on OS)
  @files = Dir.glob(pattern)

  erb :index
end


def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end


def load_content(resource)
  content = File.read(resource)

  case File.extname(resource)
  when '.txt'
    headers['Content-Type'] = 'text/plain'  # sets content type in response header
    content
  when '.md'
    erb render_markdown(content)
  end
end


# render add new document form
get '/new' do
  erb :new
end


def valid_filename?(filename)
  filename.strip.size > 0
end


# add new file
post '/new' do
  unless valid_filename?(params[:new_filename])
    session[:message] = "A non-empty name is required."
    redirect '/new'
  end

  path = File.join(data_path, params[:new_filename])

  File.open(path, 'w') { |file| file.write('')}
  session[:message] = "#{params[:new_filename]} has been created!"
  redirect '/'
end


# display file contents
get '/:filename' do
  path = File.join(data_path, params[:filename])

  unless File.file?(path)
  session[:message] = "#{params[:filename]} does not exist"
  redirect '/'
  end

  load_content(path)
end


# render edit file page
get '/:filename/edit' do
  path = File.join(data_path, params[:filename])
  @text = File.read(path)

  erb :edit
end


# edit file
post '/:filename/edit' do
  path = File.join(data_path, params[:filename])

  File.open(path, 'w') do |file|
    file.write(params[:revised_text])
    file.close
  end

  session[:message] = "#{params[:filename]} has been edited!"
  redirect '/'
end


#delete file
post '/:filename/delete' do
  path = File.join(data_path, params[:filename])

  File.delete(path)
  session[:message] = "#{params[:filename]} has been deleted!"

  redirect '/'
end


# render sign in page
get '/users/signin' do
  erb :signin
end


# check signin credentials
post '/users/signin' do

  if params[:username] == 'admin' && params[:password] == 'secret'
    session[:username] = params[:username]
    session[:message] = "Welcome #{session[:username]}!"
    redirect '/'
  else
    session[:message] = 'Invalid Credentials.'
    status 422
    erb :signin
  end
end


# sign out
post '/users/signout' do
  session[:message] = 'You have signed out.'
  session.delete(:username)
  redirect '/'
end
