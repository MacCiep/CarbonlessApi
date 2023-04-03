class CreatePrize < ActiveRecord::Migration[5.2]
  def change
    create_table :prizes do |t|
      t.string :title, null: false
      t.integer :price, null: false
      t.integer :duration, null: false
    end
  end
end
