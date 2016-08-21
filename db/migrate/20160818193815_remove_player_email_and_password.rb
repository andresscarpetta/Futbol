class RemovePlayerEmailAndPassword < ActiveRecord::Migration
  def change
    remove_column :players, :email
    remove_column :players, :password
  end
end
