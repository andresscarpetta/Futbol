class AddColumnWinnerToTournament < ActiveRecord::Migration
  def change
    add_column :tournament, :winner_id , :integer, index: true, :foreign_key => 'Player' 
  end
end
