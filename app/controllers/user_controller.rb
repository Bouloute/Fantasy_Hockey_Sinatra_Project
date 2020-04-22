class UserController < ApplicationController

    get "/signup" do
        erb :'/user/signup'
    end

    post "/signup" do

        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            #error => please fill in all the forms and try again
            redirect to "/"
        else 
            User.create(username: params[:username], email: params[:email], password: params[:password])
            redirect to "/"
        end
        
    end

end
