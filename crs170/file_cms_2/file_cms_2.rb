require 'sinatra'
require 'sinatra/reloader' if development?
require 'tilt/erubis'


root = File.expand_path('..', __FILE__)
data_path = File.join(root, 'data')

helpers do
  def shortname(full_filename)
    File.basename(full_filename)
  end
end

# view index page
get '/' do
  file_paths = File.join(data_path, '*')
  @files = Dir.glob(file_paths)

  erb :index
end

# view individual document page
get '/:filename' do
  file_path = File.join(data_path, params[:filename])
  file = File.read(file_path)

  if File.extname(file_path) == '.txt'
    headers['Content-Type'] = 'text/plain'
  end

  file
end
