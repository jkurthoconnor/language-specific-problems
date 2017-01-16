require 'sinatra'
require 'sinatra/reloader' if development?
require 'tilt/erubis'

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

# view individual document page
get '/:filename' do
  unless valid_filename?(params[:filename])
    session[:message] = "#{params[:filename]} does not exist."
    redirect '/'
  end

  file_path = File.join(data_path, params[:filename])
  file = File.read(file_path)

  if File.extname(file_path) == '.txt'
    headers['Content-Type'] = 'text/plain'
  end

  file
end
