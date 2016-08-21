class AddColumnWinnerToTournament < ActiveRecord::Migration
  def change
    add_column :tournaments, :winner_id , :integer, index: true, :foreign_key => 'Player' 
  end
end
