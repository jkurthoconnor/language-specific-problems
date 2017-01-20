ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require 'fileutils'

require_relative '../cms2'

class CmsTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    FileUtils.mkdir_p(data_path)
  end

  def teardown
    FileUtils.rm_rf(data_path)
  end

  def create_document(name, content = '')
    File.open(File.join(data_path, name), 'w') do |file|
      file.write(content)
    end
  end

  def test_index
    create_document('about.txt')
    create_document('changes.txt')

    get '/'

    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, 'about.txt</a>')
    assert_includes(last_response.body, 'changes.txt</a>')
  end

  def test_plain_text
    create_document('about.txt', 'ABOUT')

    get '/about.txt'

    assert_equal(200, last_response.status)
    assert_equal('text/plain', last_response['Content-Type'])
    assert_includes(last_response.body, 'ABOUT')
  end

  def test_markdown
    create_document('markdown.md', '### Header')

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
    assert_includes(last_response.body, "'idontexist.txt' does not exist.")

    get '/'

    assert_equal(200, last_response.status)
    refute_includes(last_response.body, "'idontexist.txt' does not exist.")
  end

  def test_edit_view
    create_document('history.txt')
    get '/history.txt/edit'

    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, "<p>Edit 'history.txt':</p>")
  end

  def test_editing_doc
    create_document('history.txt')

    post '/history.txt/edit', :edited_text => 'this is newly edited'

    get last_response['Location']

    assert_equal(200, last_response.status)
    assert_includes(last_response.body, 'has been edited!')

    get '/history.txt/edit'

    assert_equal(200, last_response.status)
    assert_includes(last_response.body, 'this is newly edited')
  end

  def test_view_new_doc_form
    get '/new'

    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, 'Add a new document:</label>')
  end

  def test_add_new_doc
    post '/new', :filename => 'newdoc.txt'

    assert_equal(302, last_response.status)

    get last_response['Location']

    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, 'newdoc.txt')
  end

  def test_add_new_doc_empty_filename
    post '/new', :filename => ''

    assert_equal(302, last_response.status)

    get last_response['Location']

    assert_equal(200, last_response.status)
    assert_includes(last_response.body, 'unique name with extension is required!')
  end

  def test_add_new_doc_without_extension
    post '/new', :filename => 'hithere'

    assert_equal(302, last_response.status)

    get last_response['Location']

    assert_equal(200, last_response.status)
    assert_includes(last_response.body, 'unique name with extension is required!')
  end

  def test_add_new_doc_dupicate_filename
    create_document('text.txt')

    post '/new', :filename => 'text.txt'

    assert_equal(302, last_response.status)

    get last_response['Location']

    assert_equal(200, last_response.status)
    assert_includes(last_response.body, 'unique name with extension is required!')
  end

  def test_delete_doc
    create_document('iexisttodie.txt')

    post '/iexisttodie.txt/delete'

    assert_equal(302, last_response.status)

    get last_response['Location']

    assert_equal(200, last_response.status)
    assert_includes(last_response.body, 'iexisttodie.txt was deleted.')
    refute_includes(last_response.body, 'iexisttodie.txt</a>')
  end
end
