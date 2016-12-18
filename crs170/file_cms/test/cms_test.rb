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

  def teardown
    FileUtils.rm_rf(data_path)
  end

  def session
    last_request.env['rack.session']
  end

  def create_document(name, content = "")
     File.open(File.join(data_path, name), "w") do |file|
       file.write(content)
     end
   end

  def test_index_as_signed_in_user
    create_document('about.md')
    create_document('changes.txt')
    get '/', {}, {'rack.session' => {username: 'admin'}}

    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, 'about.md')
    assert_includes(last_response.body, 'changes.txt')
    assert_includes(last_response.body, "action=\"/about.md/delete\"")
  end

  def test_index_not_signed_in
    create_document('about.md')
    create_document('changes.txt')
    get '/'

    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    refute_includes(last_response.body, 'about.md')
    refute_includes(last_response.body, 'changes.txt')
    refute_includes(last_response.body, "action=\"/about.md/delete\"")
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
    assert_equal('nonexistent.doc does not exist', session[:message])

    get '/'

    assert_equal(200, last_response.status)
    assert_equal(nil, session[:message])
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

    get 'about.md/edit'

    assert_equal(200, last_response.status)
    assert_includes(last_response.body, sample_text)
  end

  def test_edit_doc
    create_document('about.md', 'sample')

    post 'about.md/edit', revised_text: '## changed'

    assert_equal('about.md has been edited!', session[:message])
    assert_equal(302, last_response.status)

    get '/about.md'

    assert_equal(200, last_response.status)
    assert_includes(last_response.body, '<h2>changed</h2>')
  end

  def test_view_new_document_form
    get '/new'
    body_content = "<form action=\"/new\" method=\"post\">"

    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, body_content)
  end

  def test_create_new_document
    post '/new', {new_filename: 'test_file.md'}, {'rack.session' => { username: 'admin'}}

    assert_equal(302, last_response.status)
    assert_equal('test_file.md has been created!', session[:message])

    get '/'

    assert_includes(last_response.body, 'test_file.md')
  end

  def test_filename_validator
    post '/new', new_filename: ''

    assert_equal('A non-empty name is required.', session[:message])
  end

  def test_document_deletion
    create_document('delete_me.txt', 'I will be deleted.')

    post '/delete_me.txt/delete'

    assert_equal(302, last_response.status)
    assert_equal('delete_me.txt has been deleted!', session[:message])

    get '/', {}, {'rack.session' => {message: nil} }

    refute_includes(last_response.body, 'delete_me.txt')
  end

  def test_sign_in_form
    get 'users/signin'

    assert_equal(200, last_response.status)
    assert_includes(last_response.body, "<form action=\"/users/signin\"")
    assert_includes(last_response.body, "<input name=\"username\"")
    assert_includes(last_response.body, "<button type=\"submit\">")
  end

  def test_signin_good_credentials
    post 'users/signin', username: 'admin', password: 'secret'

    assert_equal(302, last_response.status)
    assert_equal('admin', session[:username])
    assert_equal('Welcome admin!', session[:message])
  end

  def test_signin_bad_credentials
    post 'users/signin', username: 'admin', password: 'fjdka'

    assert_equal(422, last_response.status)
    assert_equal(nil, session[:username])
    assert_includes(last_response.body, 'Invalid Credentials.')
  end

  def test_signout
    post 'users/signout'

    assert_equal(nil, session[:username])
    assert_equal('You have signed out.', session[:message])

    get last_response['Location']
    assert_includes(last_response.body, 'Sign in')
  end
end
