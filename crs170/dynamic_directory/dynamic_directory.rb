require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

get "/" do 
  @paths_files = Dir.glob("public/*")

  erb :home
end