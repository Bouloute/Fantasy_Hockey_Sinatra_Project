require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "chuut"
    set :method_override, true
    register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end

  helpers do 

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by(id: session[:user_id])
    end
 
  end
end
