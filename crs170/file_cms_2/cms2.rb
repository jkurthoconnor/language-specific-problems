require 'sinatra'
require 'sinatra/reloader' if development?
require 'tilt/erubis'
require 'redcarpet'
require 'yaml'
require 'bcrypt'


ROOT = File.expand_path('..', __FILE__)

configure do
  enable :sessions
  set :session_secret, 'ha'
end

def data_path
  if ENV['RACK_ENV'] == 'test'
    File.join(ROOT, 'test', 'data')
  else
    File.join(ROOT, 'data')
  end
end

def credentials
  if ENV['RACK_ENV'] == 'test'
    File.join(ROOT, 'test', 'users.yml')
  else
    File.join(ROOT, 'users.yml')
  end
end

helpers do
  def shortname(full_filename)
    File.basename(full_filename)
  end
end

before do
  file_paths = File.join(data_path, '*')
  @files = Dir.glob(file_paths)
end


# view index page
get '/' do
  erb :index
end

# view signin page
get '/users/signin' do
  erb :signin
end

def valid_credentials?(user_input)
  user_data = YAML.load_file(credentials)
  encrypted_password = user_data[user_input[:username]]
  entered_password = user_input[:password]

  if user_data.keys.include?(user_input[:username])
     BCrypt::Password.new(encrypted_password) == entered_password
  else
    false
  end
end

def signed_in?
  session[:user]
end

def redirect_users
  session[:message] = "You must be signed in to do that."
  redirect '/'
end

# login
post '/users/signin' do
  if valid_credentials?(params)
    session[:message] = "Welcome #{params[:username]}!"
    session[:user] = params[:username]
    redirect '/'
  else
    session[:message] = "Invalid credentials."
    erb :signin
  end
end

# logout
post '/users/signout' do
  session[:message] = "#{session.delete(:user)} is now signed out."
  redirect '/'
end

# view new document page
get '/new' do
  redirect_users unless signed_in?

  erb :new
end

def valid_filename?(name)
  !(File.exist?(name) || name.empty? || File.extname(name).empty?)
end

# create new document
post '/new' do
  redirect_users unless signed_in?

  file_path = File.join(data_path, params[:filename])

  unless valid_filename?(file_path)
    session[:message] = "A unique name with extension is required!"
    redirect '/new'
  end

  File.new(file_path, 'w')
  redirect '/'
end

# delete document
post '/:filename/delete' do
  redirect_users unless signed_in?

  file_path = File.join(data_path, params[:filename])

  File.delete(file_path)
  session[:message] = "#{params[:filename]} was deleted."
  redirect '/'
end

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

def load_content(path)
  content = File.read(path)

  case File.extname(path)
  when '.txt'
    headers['Content-Type'] = 'text/plain'
    content
  when '.md'
    erb :document, :locals => { :text => render_markdown(content) }
  end
end

# view individual document page
get '/:filename' do
  filename = params[:filename] # extract 2 lines to a method?
  file_path = File.join(data_path, filename)

  unless File.exist?(file_path)
    session[:message] = "'#{filename}' does not exist."
    redirect '/'
  end

  load_content(file_path)
end

# view document editing page
get '/:filename/edit' do
  redirect_users unless signed_in?

  filename = params[:filename] #extract 2 lines to a method?
  file_path = File.join(data_path, filename)

  @document = File.read(file_path)
  erb :edit
end

post '/:filename/edit' do
  redirect_users unless signed_in?

  filename = params[:filename] #extract 2 lines to a method?
  file_path = File.join(data_path, filename)

  File.open(file_path, 'w') do |file|
    file.write(params[:edited_text])
  end

  session[:message] = "'#{params[:filename]}' has been edited!"
  redirect '/'
end
