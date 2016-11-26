require 'tilt/erubis'
require 'sinatra'
require 'sinatra/reloader'
require 'yaml'

before do
  @data = YAML.load_file('users.yaml')
  @users = @data.keys
  # {:jamy=>{:email=>"jamy.rustenburg@gmail.com", :interests=>["woodworking", "cooking", "reading"]},   :nora=>{:email=>"nora.alnes@yahoo.com", :interests=>["cycling", "basketball", "economics"]}, :hiroko=>{:email=>"hiroko.ohara@hotmail.com", :interests=>["politics", "history", "birding"]}}
end

helpers do
  def identify_other_users
    @users.select { |user| user != @name }
  end
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
  redirect 'users/list' unless @users.include?(params[:name].to_sym)

  @name = params[:name].to_sym
  @user_profile = @data[@name]

  erb :user_page
end

not_found do
  redirect 'users/list'
end
  
  