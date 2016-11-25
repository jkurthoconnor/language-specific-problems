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
  @title = "Chapter #{number}"
  @toc = File.readlines("data/toc.txt")
  @chapter = File.readlines("data/chp#{number}.txt", "\n\n")

  erb :chapter
end
