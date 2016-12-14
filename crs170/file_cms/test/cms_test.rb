ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'

require_relative '../cms'

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    get '/'
    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, 'about.md')
    assert_includes(last_response.body, 'about.txt')
    assert_includes(last_response.body, 'changes.txt')
    assert_includes(last_response.body, 'history.txt')
  end

  def test_about
    get '/about.txt'
    assert_equal(200, last_response.status)
    assert_equal('text/plain', last_response['Content-Type'])
    assert_includes(last_response.body, 'ABOUT RUBY')
  end

  def test_changes
    get '/changes.txt'
    assert_equal(200, last_response.status)
    assert_equal('text/plain', last_response['Content-Type'])
    assert_includes(last_response.body, 'RUBY CHANGES')
  end

  def test_history
    get '/history.txt'
    assert_equal(200, last_response.status)
    assert_equal('text/plain', last_response['Content-Type'])
    assert_includes(last_response.body, 'RUBY HISTORY')
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
    get 'about.md'
    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, '<h3>ABOUT RUBY</h3>')
  end

  def test_edit_view
    get 'edit/about.md'
    assert_equal(200, last_response.status)

    get 'edit/about.txt'
    assert_equal(200, last_response.status)

    get 'edit/changes.txt'
    assert_equal(200, last_response.status)

    get 'edit/history.txt'
    assert_equal(200, last_response.status)

  end

end
