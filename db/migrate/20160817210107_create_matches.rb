class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :status

      t.references :first_player
      t.references :second_player
      t.references :tournament, index: true

      t.timestamps null: false
    end
  end
end
