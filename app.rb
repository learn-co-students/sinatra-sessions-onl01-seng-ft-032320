require_relative 'config/environment'

class App < Sinatra::Base
  configure do
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  before do
    content_type :txt
  end

  get '/' do
    "Welcome to Sinatra Sessions! In this lab, we will be learning about the general principles behind a sessions cookie. In order to proceed, let's go to the '/first_exercise' path."
  end

  get '/first_exercise' do
    "Your first exercise will be to set your session key-value pair.\nIn the route: get '/set', write a line of code that sets the :foo key of the session hash equal to 'hello'.\nThen, navigate to the '/set' path."
  end

  get '/set' do
    # set the :foo key of the session hash equal to 'hello' here!
    session[:foo] = 'hello'
    if session[:foo] == 'hello'
      redirect '/fetch'
    else
      "Session value has not been set!"
    end
  end

  get '/fetch' do
    "You did it! session[:foo] value: #{session[:foo]}.\nMove on to Part II of this lab at '/second_exercise' "
  end

  get '/second_exercise' do
    "Your second lesson will be to set your session :id key to a value.\nIn the route: /set_session, write a line of code that sets the session[:id] equal to 1.\nThen, navigate to the '/set_session' path"
  end

  get '/set_session' do
    #set session id here
    session[:id] =1
    if session[:id] == 1
      # "Session ID set. It's currently set to #{session[:id]}."
      redirect '/fetch_session_id'
    else
      "Session ID has not been set!"
    end
  end

  get '/fetch_session_id' do
    "You did it! session[:id] value: #{session[:id]}.\nNow, clear the session in the '/logout' route.\nSee the readme for further instructions.\nThen, navigate to the '/logout' path."
  end

  get '/logout' do
     session content: {"session_id"=>"0a7fcd71f31bd9d0553b72a9a6b765b49471cfae1ab1b35dc9da595360e26b72", "csrf"=>"bQB1WRgEhgjDzJ4DFH5DuGy1jYr2Ez5u3JdGgGGFnUg=", "tracking"=>{"HTTP_USER_AGENT"=>"47c96af079453b379b8911640d9f3918ab476b7d"}, "foo"=>"hello", "id"=>1}
    "Session has now been cleared. session content: #{session.inspect}. Continue on to the '/finish' line!"
  end

  get '/finish' do
    "Hopefully that explains a little more about the concept of sessions.\nThe session is simply a way to store user data on a temporary basis.\nIn any web application, a user ID is typically used as a session ID.\nThis is because an ID attribute of a user is a unique identifier\nthat will always be distinguishable from other user ID attributes."
  end
end
