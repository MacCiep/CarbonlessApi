class ChangeTravelToolToCategoryAddTypeAndPriceInHistoryPoint < ActiveRecord::Migration[5.2]
  def change
    rename_column :history_points, :travel_tool, :category
    add_column :history_points, :history_type, :integer
    add_column :history_points, :purchase_price, :integer
  end
end
