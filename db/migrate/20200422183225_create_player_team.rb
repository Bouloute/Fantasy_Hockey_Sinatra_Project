class CreatePlayerTeam < ActiveRecord::Migration
  def change
    create_table :player_teams do |t|
      t.integer :player_id
      t.integer :team_id
    end
  end
end
