require 'tilt/erubis'
require 'sinatra'
require 'sinatra/reloader'
require 'yaml'

before do
  @users = YAML.load_file('users.yaml')
end

get '/' do
  redirect '/users'
end 

get '/users' do
  erb :users
end