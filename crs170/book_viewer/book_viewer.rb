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
  
  def show_search_message(hits)
    # show results heading and list if hits
    # show no matches message if no hits
    # show no message if no search terms entered
  end

  def list_search_results
    links = @hits.map do |hit| 
      "<li><a href='/chapters/#{hit}'>#{@toc[hit - 1]}</a></li>"
    end

    links.join
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

get "/search" do
  @chapter = File.read("data/chp1.txt")
  @term = params[:query]
  @hits = []

  if @term
    @toc.size.times do |n|
      chapter = File.read("data/chp#{n + 1}.txt")
      @hits.push(n + 1) if chapter.include?(@term)
    end
  end

  erb :search
end

not_found do
  redirect "/"
end
