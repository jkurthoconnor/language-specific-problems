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
  def due_dates(assignments)
    assignments.keys
  end

  def day_name(date)
    DAYS[date.cwday].capitalize
  end

  def month_name(date)
    MONTHS[date.month].capitalize
  end

  def day_num(date)
    date.day
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
  year, month, date = parse_date_string(params[:date])
  @date = Date.new(year, month, date)
  @homework = @assignments[params[:date].to_i]
  erb :day
end

# ## add redirection to index for any invalid url requests