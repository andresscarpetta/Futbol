class CreatePlayerInfos < ActiveRecord::Migration
  def change
    create_table :player_infos do |t|
      t.integer :currentPoints
      t.string :team

      t.belongs_to :tournament, index: true
      t.belongs_to :player, index: true

      t.timestamps null: false
    end
  end
end
