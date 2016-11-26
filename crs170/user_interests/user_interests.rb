require 'tilt/erubis'
require 'sinatra'
require 'sinatra/reloader'
require 'yaml'

before do
  @data = YAML.load_file('users.yaml')
  # {:jamy=>{:email=>"jamy.rustenburg@gmail.com", :interests=>["woodworking", "cooking", "reading"]},   :nora=>{:email=>"nora.alnes@yahoo.com", :interests=>["cycling", "basketball", "economics"]}, :hiroko=>{:email=>"hiroko.ohara@hotmail.com", :interests=>["politics", "history", "birding"]}}
end

get '/' do
  redirect '/users/list'
end 

get '/users' do
  redirect '/users/list'
end

get '/users/list' do
  erb :name_list
end

get '/users/:name' do
  redirect 'users/list' unless @data.keys.include?(params[:name].to_sym)

  @user_name = params[:name].to_sym
  @user_profile = @data[@user_name]

  erb :user_page
end

not_found do
  redirect 'users/list'
end
  
  