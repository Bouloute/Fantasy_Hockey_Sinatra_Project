class UserController < ApplicationController

    get "/signup" do
        if logged_in?
            #error =>you are already logged in.
            redirect to "/"
        else
            erb :'/user/signup'
        end
    end

    post "/signup" do

        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            #error => please fill in all the forms and try again
            redirect to "/"
        else 
            user = User.create(username: params[:username], email: params[:email], password: params[:password])
            session[:user_id] = user.id
            redirect to "/"
        end

    end


    get "/login" do 
        if logged_in?
            #error =>you are already logged in.
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
            #error => unable to find you, please check your information and try again
            redirect to "/login"
        end
    end


    get "/logout" do 
        if logged_in?
            session.destroy
            redirect to '/'
        else
            #error =>you are already logged out.
            redirect to "/"
        end
    end
end
