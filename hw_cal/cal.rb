require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

data_path = File.expand_path('../data', __FILE__)
assignments_path = File.join(data_path, 'assignments.yml')

before do
  @assignments = YAML.load_file(assignments_path)
end


helpers do
  def get_dates(cal_data)
    cal_data.keys
  end
end


# display index of assignment dates
get '/' do
  erb :index
end


# display page homework assignments for given date
get '/:date' do
  @date = @assignments[params[:date].to_i]
  erb :day
end