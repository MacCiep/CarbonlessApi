class AddTravelToolToTravelSession < ActiveRecord::Migration[5.2]
  def change
    add_column :travel_sessions, :travel_tool, :integer
  end
end
