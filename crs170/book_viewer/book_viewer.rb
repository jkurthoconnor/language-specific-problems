require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

get "/" do
  @title = "The Adventures of Sherlock Holmes"
  @toc = File.readlines("data/toc.txt")

  erb :home
end

get "/chapters/1" do
  @title = "Chapter 1"
  @toc = File.readlines("data/toc.txt")
  @chapter1 = File.readlines("data/chp1.txt", "\n\n")
  erb :chp1
end
