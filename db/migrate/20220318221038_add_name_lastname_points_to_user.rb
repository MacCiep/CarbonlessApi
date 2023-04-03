class AddNameLastnamePointsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :lastname, :string, null: false
    add_column :users, :points, :bigint, null: false, default: 0
  end
end
