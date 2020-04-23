class TeamController < ApplicationController

    get "/teams" do
        if logged_in?
            @teams = current_user.teams
            erb :'/team/teams'
        else
            flash[:error] = "You need to log in to access you team setup"
            redirect to "/login"
        end
    end

    get "/teams/new" do
        if logged_in?
            erb :'/team/new'
        else
            flash[:error] = "You need to log in to create a new team setup"
            redirect to "/login"
        end
    end

    post "/teams/new" do
        #HTML prevents arriving at this point. Double security
        if params[:name] == ""
            flash[:error] = "Please fill in all the informations and try again"
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
        if logged_in? && current_user.id == @team.user.id
            erb :'/team/show'
        else
            flash[:error] = "You have not created this team, you might want to login"
            redirect to "/teams"
        end
    end

    
    get "/teams/:id/edit" do 
        @team = Team.find_by(id: params[:id])
        
        if logged_in? && current_user.id == @team.user.id
            erb :'/team/edit'
        else
            flash[:error] = "You have not created this team, you might want to login"
            redirect to "/teams"
        end
    end

    patch "/teams/:id/edit" do 
        player = Player.find_by(id: params[:player_id])
        team = Team.find_by(id: params[:id])

        #checks for duplicates 
        if team.players.include?(player) 
            flash[:error] = "Player is already added to your team"
            redirect to "/teams/#{params[:id]}/edit"
        end
        #max number of players
        if team.players.size >= 7
            flash[:error] = "Your team has reached the maxium limit of players on ice"
            redirect to "/teams/#{params[:id]}/edit"
        end

        #adds player
        team.players.push(player)

        redirect to "/teams/#{params[:id]}/edit"
    end

    
    patch "/teams/:id/edit/name" do 
        team = Team.find_by(id: params[:id])
        team.update(params[:team])
             
        redirect to "/teams/#{params[:id]}/edit"    
    end

    
    delete "/teams/:team_id/player_removal/:player_id" do 
        player = Player.find_by(id: params[:player_id])
        team = Team.find_by(id: params[:team_id])
        team.players.delete(player)
        redirect to "/teams/#{params[:team_id]}/edit"
    end

    delete "/teams/:id" do 
        team = Team.find_by(id: params[:id])
        team.delete
        redirect to "/teams"
    end
end
