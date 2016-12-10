require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'tilt/erubis'

helpers

def clean_filename(name)
  name.split('/').last
end

get '/' do
  @files = Dir.glob("public/*").select { |filename| filename =~ /\./ }

  erb :index
end