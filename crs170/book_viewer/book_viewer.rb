require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

get "/" do
  @title = "The Adventures of Sherlock Holmes"
  @toc = File.readlines("data/toc.txt")

  erb :home
end

get "/chapters/:number" do
  number = params[:number]
  @toc = File.readlines("data/toc.txt")
  @title = @toc[number.to_i - 1]
  @chapter = File.readlines("data/chp#{number}.txt", "\n\n")

  erb :chapter
end
