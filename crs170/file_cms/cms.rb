require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'tilt/erubis'


configure do
  enable :sessions
  set :session_secret, 'secret'

end


helpers do
  def clean_filename(filename) # input e.g.: "/Users/oconnor/dropbox/coding/lsch/crs170/file_cms/data/about.txt"
  File.basename(filename) # output: "about.txt"
  end
end

root = File.expand_path('..', __FILE__) #=> "/Users/oconnor/dropbox/coding/lsch/crs170/file_cms"

get '/' do
  @files = Dir.glob(root + '/data/*')
  erb :index
end

def file_exists?(short_filename)
  @files.any? do |full_path|
    File.basename(full_path) == (short_filename)
  end
end


get '/:filename' do
  @files = Dir.glob(root + '/data/*')

  if file_exists?(params[:filename])
    @text = File.read(root + '/data/' + params[:filename])
    headers['Content-Type'] = 'text/plain'  # sets content type in response header
    erb :document
  else
    session[:error] = "#{params[:filename]} does not exist"
    redirect '/'
  end
end
