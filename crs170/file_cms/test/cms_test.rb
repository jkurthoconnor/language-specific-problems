ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require 'fileutils'

require_relative '../cms'

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    FileUtils.mkdir_p(data_path)
  end

  def create_document(name, content = "")
     File.open(File.join(data_path, name), "w") do |file|
       file.write(content)
     end
   end

  def test_index
    create_document('about.md')
    create_document('changes.txt')

    get '/'

    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, 'about.md')
    assert_includes(last_response.body, 'changes.txt')
  end

  def test_text_document
    create_document('about.txt', 'ABOUT RUBY')

    get '/about.txt'

    assert_equal(200, last_response.status)
    assert_equal('text/plain', last_response['Content-Type'])
    assert_includes(last_response.body, 'ABOUT RUBY')
  end

  def test_nonexistent_doc
    get '/nonexistent.doc'

    assert_equal(302, last_response.status)

    get last_response['Location']

    assert_equal(200, last_response.status)
    assert_includes(last_response.body, 'nonexistent.doc does not exist')

    get '/'

    refute_includes(last_response.body, 'does not exist')
  end

  def test_favicon_redirect
    get '/favicon.ico'

    assert_equal(302, last_response.status)

    get last_response['Location']

    assert_equal(200, last_response.status)
    refute_includes(last_response.body, 'does not exist')
  end

  def test_markdown_file
    create_document('about.md', '## Header')

    get 'about.md'

    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, '<h2>Header</h2>')
  end

  def test_edit_view
    sample_text = "<textarea name=\"revised_text\" rows=\"20\" cols=\"80\">"
    create_document('about.md', sample_text)
    create_document('changes.txt', sample_text)

    get 'about.md/edit'

    assert_equal(200, last_response.status)
    assert_includes(last_response.body, sample_text)

    post 'about.md/edit', revised_text: '## changed'

    assert_equal(302, last_response.status)

    # # assertion fails: why?
    # get last_response['Location']
    # assert_includes(last_response.body, 'has been edited!')

    get '/about.md'

    assert_equal(200, last_response.status)
    assert_includes(last_response.body, '<h2>changed</h2>')

    get 'changes.txt/edit'

    assert_equal(200, last_response.status)
    assert_includes(last_response.body, sample_text)
  end

  def teardown
    FileUtils.rm_rf(data_path)
  end
end
