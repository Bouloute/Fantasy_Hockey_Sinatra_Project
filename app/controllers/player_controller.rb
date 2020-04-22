class PlayerController < ApplicationController

    get "/players" do
        erb :'/player/players'
    end

end
