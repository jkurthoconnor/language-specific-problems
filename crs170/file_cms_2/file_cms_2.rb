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

get '/' do
  file_paths = File.join(data_path, '*')
  @files = Dir.glob(file_paths)

  erb :index
end