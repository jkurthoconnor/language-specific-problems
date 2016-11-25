require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

before do
  @toc = File.readlines("data/toc.txt")
end

helpers do
  def in_paragraphs(text)
    paragraphs = text.split("\n\n")
    paragraphs.map { |para| "<p>#{para}</p>" }.join
  end
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"

  erb :home
end

get "/chapters/:number" do
  number = params[:number].to_i
  redirect "/" if number > @toc.size
  @title = @toc[number - 1]
  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

not_found do
  redirect "/"
end
