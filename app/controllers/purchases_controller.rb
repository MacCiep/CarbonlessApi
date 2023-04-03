class PurchasesController < ApplicationController
  PURCHASE_HISTORY_POINT_TYPE = 1
  AVERAGE_CO2_PER_CLOTHING = 3.2 / 5 # Temporary value
  AVERAGE_CO2_PER_FOOD = 1 / 2.0
  POINTS_MULTIPLY = 3
  PURCHASE_TYPE = {
    food: 5,
    clothes: 6
  }

  def create
    if params[:category] != PURCHASE_TYPE[:food] && params[:category] != PURCHASE_TYPE[:clothes]
      render status: :unprocessable_entity
      return
    end

    price = params[:price]
    final_points = price * POINTS_MULTIPLY
    @point_history = current_user.history_points.new(history_type: PURCHASE_HISTORY_POINT_TYPE, purchase_price: price,
                                                     points: final_points, category: params[:category])

    current_user.points += final_points
    current_user.total_carbon_saved += params[:category] == PURCHASE_TYPE[:food] ? AVERAGE_CO2_PER_FOOD * price : AVERAGE_CO2_PER_CLOTHING * price

    if @point_history.save && current_user.save
      render json: { updated_points: current_user.points, updated_carbon_saved: current_user.total_carbon_saved },
             status: :ok
    else
      render json: @point_history.errors.full_messages, status: :unprocessable_entity
    end
  end
end
