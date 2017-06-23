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

  def session
    last_request.env['rack.session']
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

  def test_view_plain_text
    create_document('about.txt', 'ABOUT')

    get '/about.txt'

    assert_equal(200, last_response.status)
    assert_equal('text/plain', last_response['Content-Type'])
    assert_includes(last_response.body, 'ABOUT')
  end

  def test_view_markdown
    create_document('markdown.md', '### Header')

    get '/markdown.md'

    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, '<h3>Header</h3>')
  end

  def test_nonexistent_doc
    get '/idontexist.txt'

    assert_equal(302, last_response.status)
    assert_equal("'idontexist.txt' does not exist.", session[:message])

    get last_response['Location']

    assert_equal(200, last_response.status)
    refute_includes(session.keys, 'message')
  end

  def test_edit_view_user_signed_in
    create_document('history.txt')
    get '/history.txt/edit', {}, {'rack.session' => { :user => 'admin' } }

    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, "<p>Edit 'history.txt':</p>")
  end
  
  def test_edit_view_user_not_signed_in
    create_document('history.txt')
    get '/history.txt/edit'

    assert_equal(302, last_response.status)
    assert_equal('You must be signed in to do that.', session[:message])
  end

  def test_editing_doc_user_signed_in
    create_document('history.txt')

    post '/history.txt/edit', {:edited_text => 'this is newly edited'}, { 'rack.session' => { :user => 'admin' }}

    assert_includes(session[:message], 'has been edited!')

    get '/history.txt/edit'

    assert_equal(200, last_response.status)
    assert_includes(last_response.body, 'this is newly edited')
  end

  def test_editing_doc_user_not_signed_in
    create_document('history.txt')

    post '/history.txt/edit'

    assert_equal(302, last_response.status)
    assert_equal('You must be signed in to do that.', session[:message])
  end
  
  def test_view_new_doc_form_user_signed_in
    get '/new', {}, { 'rack.session' => { :user => 'admin' } }

    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, 'Add a new document:</label>')
  end

  def test_view_new_doc_form_user_not_signed_in
    get '/new'

    assert_equal(302, last_response.status)
    assert_equal('You must be signed in to do that.', session[:message])
  end
  
  def test_add_new_doc_user_signed_in
    post '/new', {:filename => 'newdoc.txt'}, { 'rack.session' => { :user => 'admin' } }

    assert_equal(302, last_response.status)

    get last_response['Location']

    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, 'newdoc.txt')
  end

  def test_add_new_doc_user_not_signed_in
    post '/new', :filename => 'newdoc.txt'

    assert_equal(302, last_response.status)
    assert_equal('You must be signed in to do that.', session[:message])
  end

  def test_add_new_doc_empty_filename
    post '/new', {:filename => ''}, { 'rack.session' => { :user => 'admin' }}

    assert_equal(302, last_response.status)
    assert_includes(session[:message], 'unique name with extension is required!')
  end

  def test_add_new_doc_without_extension
    post '/new', {:filename => 'hithere'}, { 'rack.session' => { :user => 'admin' }}

    assert_equal(302, last_response.status)
    assert_includes(session[:message], 'unique name with extension is required!')
  end

  def test_add_new_doc_duplicate_filename
    create_document('text.txt')

    post '/new', {:filename => 'text.txt'}, { 'rack.session' => { :user => 'admin' }}

    assert_equal(302, last_response.status)
    assert_includes(session[:message], 'unique name with extension is required!')
  end

  def test_delete_doc_user_signed_in
    create_document('iexisttodie.txt')

    post '/iexisttodie.txt/delete', {}, { 'rack.session' => { :user => 'admin' }}

    assert_equal(302, last_response.status)
    assert_includes(session[:message], 'iexisttodie.txt was deleted.')

    get last_response['Location']

    assert_equal(200, last_response.status)
    refute_includes(last_response.body, 'iexisttodie.txt</a>')
  end

  def test_delete_doc_user_not_signed_in
    create_document('iexisttodie.txt')

    post '/iexisttodie.txt/delete'

    assert_equal(302, last_response.status)
    assert_equal('You must be signed in to do that.', session[:message])
  end

  def test_view_signin_page
    get '/users/signin'

    assert_equal(200, last_response.status)
    assert_includes(last_response.body, "<form action=\"/users/signin\"")
    assert_includes(last_response.body, "<label for=\"username\">Username:")
    assert_includes(last_response.body, "<label for=\"password\">Password:")
  end

  def test_valid_credentials_signin
    post '/users/signin', {:username => 'admin', :password => 'secret'}

    assert_equal(302, last_response.status)
    assert_equal(session[:message], 'Welcome admin!')
    assert_equal(session[:user], 'admin')

    get last_response['Location']

    assert_equal(200, last_response.status)
    assert_includes(last_response.body, "<p class=\"flash_message\">Welcome admin!")
  end

  def test_invalid_credentials_signin
    post '/users/signin', {:username => 'butch', :password => 'what?'}

    refute_includes(session.keys, 'user')
    assert_includes(last_response.body, "<p class=\"flash_message\">Invalid credentials.")
  end

  def test_signout
    get '/', {}, { 'rack.session' => { :user => 'admin'} }

    assert_includes(session.keys, 'user')

    post '/users/signout'
    assert_equal(302, last_response.status)
    assert_includes(session[:message], 'is now signed out.')
    refute_includes(session.keys, 'user')
  end
end
