class CreateHistoryPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :history_points do |t|
      t.belongs_to :user
      t.bigint :points, null: false
      t.timestamps null: false
    end
  end
end
