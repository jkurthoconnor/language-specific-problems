ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'

require_relative '../cms2'

class CmsTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    get '/'

    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, 'about.txt</a></li>')
    assert_includes(last_response.body, 'changes.txt</a></li>')
    assert_includes(last_response.body, 'history.txt</a></li>')
  end

  def test_plain_text
    get '/about.txt'

    assert_equal(200, last_response.status)
    assert_equal('text/plain', last_response['Content-Type'])
    assert_includes(last_response.body, 'ABOUT')
  end
  
  def test_markdown
    get '/markdown.md'

    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, '<h3>Header</h3>')
  end

  def test_nonexistent_doc
    get '/idontexist.txt'

    assert_equal(302, last_response.status)

    get last_response['Location']

    assert_equal(200, last_response.status)
    assert_includes(last_response.body, 'idontexist.txt does not exist.')

    get '/'

    assert_equal(200, last_response.status)
    refute_includes(last_response.body, 'idontexist.txt does not exist.')
  end
end
