class ChangeTournamentStatusToString < ActiveRecord::Migration
  def change
    change_column :tournaments, :status, :string
  end
end
