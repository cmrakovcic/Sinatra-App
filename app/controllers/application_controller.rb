require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "video_game_collection"
  end

  get "/" do
    erb :welcome
  end

  helpers do
    
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(:email => session[:email]) if session[:email]
    end

    def login(email, password)
      # check if user w this email exists, if so set the session. otherwise:
        #return false or redirect "/login"
      # Is the user who they claim to be
       #if statement assignment, truthy. End w a local variable called user.
       #will return as nil, if no user is found
      user = User.find_by(:email => email)
      if user && user.authenticate(password)
        session[:email] = user.email
      else
        redirect "/login"
      end
    end
    
    def logout!
    session.clear
    # Emailing them to let them know they logged out
    end
  end
end
