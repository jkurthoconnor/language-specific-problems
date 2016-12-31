require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

DAYS = { 1 => 'monday', 2 => 'tuesday', 3 => 'wednesday', 4 => 'thursday',
         5 => 'friday', 6 => 'saturday', 7 => 'sunday' }.freeze
MONTHS = { 1 => 'january', 2 => 'february', 3 => 'march', 4 => 'april',
           5 => 'may', 6 => 'june', 7 => 'july', 8 => 'august',
           9 => 'september', 10 => 'october', 11 => 'november',
           12 => 'december' }.freeze

data_path = File.expand_path('../data', __FILE__)
assignments_path = File.join(data_path, 'assignments.yml')

before do
  @assignments = YAML.load_file(assignments_path)
end

helpers do
  def get_dates(assignments)
    assignments.keys
  end

  def day_name(date_object)
    DAYS[date_object.cwday].capitalize
  end

  def month_name(date_object)
    MONTHS[date_object.month].capitalize
  end

  def day_num(date_object)
    date_object.day
  end
end

# display index of assignment dates
get '/' do
  erb :index
end

def parse_date_string(string)
  year = string[0, 4].to_i
  month = string[4, 2].to_i
  date = string[6, 2].to_i

  [year, month, date]
end

# display assignments for given date
get '/:date' do
  date = parse_date_string(params[:date])
  @date = Date.new(date[0], date[1], date[2])
  @homework = @assignments[params[:date].to_i]
  erb :day
end
