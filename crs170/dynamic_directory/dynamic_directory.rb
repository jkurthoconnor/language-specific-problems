require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

get "/" do
  path = request.fullpath
  option = path.split('?').last.split('=').last
  if option == 'reverse'
    @paths_files = Dir.glob("public/*").reverse
  else
    @paths_files = Dir.glob("public/*")
  end

  erb :home
end
