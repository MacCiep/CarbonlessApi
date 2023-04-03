class CreateAchievements < ActiveRecord::Migration[5.2]
  def change
    create_table :achievements do |t|
      t.string :title, null: false
      t.integer :scope_of_days
      t.integer :points
      t.integer :type
      t.string :script, null: false
    end
  end
end
