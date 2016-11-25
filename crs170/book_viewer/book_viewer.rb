require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

def search_results
  chapters_with_hits = []
  unless (@term.nil?) || (@term == '')
    @toc.size.times do |n|
      chapter = File.read("data/chp#{n + 1}.txt")
      chapters_with_hits.push(n + 1) if chapter.include?(@term)
    end
  end
  chapters_with_hits
end

before do
  @toc = File.readlines("data/toc.txt")
end

helpers do
  def in_paragraphs(text)
    paragraphs = text.split("\n\n")
    paragraphs.map { |para| "<p>#{para}</p>" }.join
  end

  def show_search_message
    return unless @term

    if @hits.empty?
      "<p>Sorry, no matches were found.</p>"
    else
      "<h2 class=\"content-subhead\">Results for '#{ @term }'</h2>" \
      "<ul>#{ list_search_results }</ul>"
    end
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
  @term = params[:query]
  @hits = search_results

  erb :search
end

not_found do
  redirect "/"
end
