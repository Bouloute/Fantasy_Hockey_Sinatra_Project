class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :role
      t.string :team
      t.string :stats
      t.string :picture_path
    end
  end
end
