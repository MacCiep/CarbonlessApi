class CreateUsersPrizes < ActiveRecord::Migration[5.2]
  def change
    create_table :users_prizes do |t|
      t.belongs_to :user
      t.belongs_to :prize
      t.integer :duration_left, null: false
    end
  end
end
