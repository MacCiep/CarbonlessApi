class CreateTravelSession < ActiveRecord::Migration[5.2]
  def change
    create_table :travel_sessions do |t|
      t.belongs_to :user
      t.integer :start_station, null: false
      t.integer :end_station
      t.timestamps null: false
    end
  end
end
