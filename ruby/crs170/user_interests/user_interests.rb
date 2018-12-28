require 'tilt/erubis'
require 'sinatra'
require 'sinatra/reloader'
require 'yaml'

before do
  @title = 'User Interests Network'
  @data = YAML.load_file('users.yaml')
  @users = @data.keys
end

helpers do
  def identify_other_users
    @users.select { |user| user != @name }
  end

  def count_users
    @users.size
  end

  def count_interests
    @data.map { |user, _| @data[user][:interests].count }.reduce(&:+)
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
  @params = params
  @name = params[:name].to_sym
  @user_profile = @data[@name]

  erb :user_page
end

not_found do
  redirect 'users/list'
end
