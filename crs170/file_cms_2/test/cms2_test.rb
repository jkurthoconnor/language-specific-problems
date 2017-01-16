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
end
