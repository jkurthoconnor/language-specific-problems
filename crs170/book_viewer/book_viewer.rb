require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

def search_results
  chapter_and_hits = {}

  unless (@term.nil?) || (@term == '')
    (1..@toc.size).each do |chap|
      chapter_paragraphs = File.readlines("data/chp#{chap}.txt", ("\n\n"))
      para_with_hits = []
      chapter_paragraphs.each_with_index do |para, index|
        para_with_hits << index if para.include?(@term)
      end
      chapter_and_hits[chap] = para_with_hits unless para_with_hits.empty?
    end
  end

  chapter_and_hits
end

before do
  @toc = File.readlines("data/toc.txt")
end

helpers do
  def in_paragraphs(text)
    paragraphs = text.split("\n\n")
    paragraphs.map.with_index { |para, ind| "<p id=\"#{ind}\">#{para}</p>" }.join
  end

  def show_search_message
    return unless @term

    if @hits.empty?
      "<p>Sorry, no matches were found.</p>"
    else
      "<h2 class=\"content-subhead\">Results for '#{ @term }'</h2>"
    end
  end

  def return_text(chapter, paragraph)
    File.readlines("data/chp#{chapter}.txt", "\n\n")[paragraph]
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
  @term = params[:query]
  @hits = search_results

  erb :search
end

not_found do
  redirect "/"
end
