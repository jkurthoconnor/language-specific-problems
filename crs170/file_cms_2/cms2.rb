require 'sinatra'
require 'sinatra/reloader' if development?
require 'tilt/erubis'
require 'redcarpet'

configure do
  enable :sessions
  set :session_secret, 'ha'
end

root = File.expand_path('..', __FILE__)
data_path = File.join(root, 'data')

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

def valid_filename?(name)
  filenames = @files.map {|file| File.basename(file)}
  filenames.include?(name)
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
    render_markdown(content)
  end
end

# view individual document page
get '/:filename' do
  filename = params[:filename]
  file_path = File.join(data_path, filename)

  unless valid_filename?(filename)
    session[:message] = "#{filename} does not exist."
    redirect '/'
  end

  load_content(file_path)
end
