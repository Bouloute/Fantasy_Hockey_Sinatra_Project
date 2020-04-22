class TeamController < ApplicationController

    get "/teams" do
        if logged_in?
            @teams = current_user.teams
            erb :'/team/teams'
        else
            #please log in
            redirect to "/login"
        end
    end

    get "/teams/new" do
        if logged_in?
            erb :'/team/new'
        else
            #please log in
            redirect to "/login"
        end
    end

    post "/teams/new" do

        if params[:name] == ""
            #error => please fill in all the forms and try again
            redirect to "/teams/new"
        else 
            team = Team.create(name: params[:name])
            team.user = current_user
            team.save
            redirect to "/teams"
        end

    end

    get "/teams/:id" do 
        @team = Team.find_by(id: params[:id])
       # binding.pry
        if logged_in? && current_user.id == @team.user.id
            erb :'/team/show'
        else
            #please log in
            redirect to "/teams"
        end
    end

    
    get "/teams/:id/edit" do 
        @team = Team.find_by(id: params[:id])
       # binding.pry
        if logged_in? && current_user.id == @team.user.id
            erb :'/team/edit'
        else
            #You have not created this team, you might want to login.
            redirect to "/teams"
        end
    end

    

    patch "/teams/:id/edit" do 
       # binding.pry
        # check if name was edited

        #removes players

        #checks for duplicates
        #adds players 
        player = Player.find_by(id: params[:player_id])
        team = Team.find_by(id: params[:id])
        team.players.push(player)

        redirect to "/teams/#{params[:id]}/edit"
    end
end
