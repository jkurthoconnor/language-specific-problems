require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'tilt/erubis'

helpers do
  def clean_filename(filename) # input e.g.: /Users/oconnor/dropbox/coding/lsch/crs170/file_cms/data/about.txt
  File.basename(filename)
  end
end

root = File.expand_path('..', __FILE__) #=> /Users/oconnor/dropbox/coding/lsch/crs170/file_cms

get '/' do
  @files = Dir.glob(root + '/data/*')

  erb :index
end


get '/:filename' do
  @text = File.read(root + '/data/' + params[:filename])

  headers['Content-Type'] = 'text/plain'  # sets template content type; Default depends on template language.
  erb :document
end