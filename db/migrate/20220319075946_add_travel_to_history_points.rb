class AddTravelToHistoryPoints < ActiveRecord::Migration[5.2]
  def change
    add_column :history_points, :travel_tool, :integer
  end
end
