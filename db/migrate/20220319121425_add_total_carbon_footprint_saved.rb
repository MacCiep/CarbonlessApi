class AddTotalCarbonFootprintSaved < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :total_carbon_saved, :numeric, default: 0
  end
end
