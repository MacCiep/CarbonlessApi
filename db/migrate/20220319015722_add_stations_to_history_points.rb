class AddStationsToHistoryPoints < ActiveRecord::Migration[5.2]
  def change
    add_column :history_points, :start_station, :integer
    add_column :history_points, :end_station, :integer
  end
end
