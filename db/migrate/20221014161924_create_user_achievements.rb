class CreateUserAchievements < ActiveRecord::Migration[5.2]
  def change
    create_table :user_achievements do |t|
      t.belongs_to :user, null: false
      t.belongs_to :achievement, null: false
      t.integer :counter, null: false, default: 0
    end
  end
end
