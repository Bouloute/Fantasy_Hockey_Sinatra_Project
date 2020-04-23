class UserController < ApplicationController

    get "/signup" do
        if logged_in?
            flash[:error] = "Please log out if you wish to Sign up"
            redirect to "/" 
        else
            erb :'/user/signup'
        end
    end

    post "/signup" do

        #verifies uniqness of email
        if User.find_by(email: params[:email])
            flash[:error] = "This email is already registered"
            
            redirect to "/"
        end

        #should never happen due to html
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            flash[:error] = "Please fill in all the informations and try again"
            redirect to "/"
        else 
            user = User.create(username: params[:username], email: params[:email], password: params[:password])
            session[:user_id] = user.id
            redirect to "/"
        end

    end


    get "/login" do 
        if logged_in?
            flash[:error] = "You are already logged in"
            redirect "/"
        else
            erb :'/user/login'
        end
    end

    post "/login" do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to "/"
        else
            flash[:error] = "Unable to find you, please check your information and try again"
            redirect to "/login"
        end
    end


    get "/logout" do 
        if logged_in?
            session.destroy
            redirect to '/'
        else
            flash[:error] = "You are already logged out"
            redirect to "/"
        end
    end
end
