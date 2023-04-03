class AddTgtgFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tgtg_active, :boolean, default: false, null: false
    add_column :users, :tgtg_id, :integer
  end
end
