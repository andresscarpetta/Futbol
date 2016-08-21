class AddReferenceFromPlayerToTournament < ActiveRecord::Migration
  def change
  	add_column :tournaments, :winner_id, :integer
  	add_index :tournaments, :winner_id
  end
end
