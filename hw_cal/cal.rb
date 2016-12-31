require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'


get '/' do
  # generates and displays links for all class days; data stored in yml file(s) in `/data`
  # use single file to store all day and homework info? use one file per day?
  erb :index
end


get '/:date' do
  # serve page for homework assignments for given date
  erb :day
end