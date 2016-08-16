class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.integer :minPlayers
      t.boolean :status

      t.timestamps null: false
    end
  end
end
