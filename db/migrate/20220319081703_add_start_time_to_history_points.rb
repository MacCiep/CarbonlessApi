class AddStartTimeToHistoryPoints < ActiveRecord::Migration[5.2]
  def change
    add_column :history_points, :start_datetime, :datetime
  end
end
