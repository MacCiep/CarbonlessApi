class HistoryPointsController < ApplicationController
  def index
    render json: paginated_response(current_user.history_points.order("created_at DESC")), status: :ok
  end
end
