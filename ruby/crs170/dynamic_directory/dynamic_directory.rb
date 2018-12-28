require 'tilt/erubis'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  path = request.fullpath
  option = path.split('=').last

  @paths_files = Dir.glob('public/*').sort
  @paths_files.reverse! if option == 'reverse'

  erb :home
end
