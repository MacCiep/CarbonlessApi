class TgtgIntegrationsController < ApplicationController
  def create
    response = TgtgMicroservice::Requests::Authorization.new(current_user).call
    if response.present?
      current_user.update(tgtg_active: true, tgtg_id: response)
      render json: { message: 'User created, please check your email to accept connection' }, status: :created
    else
      render json: { message: 'Something went wrong, please try another time' }, status: 422
    end
  end

  def show
    result = TgtgMicroservice::Requests::AddOrderPoints.new(current_user).call
    if result.present?
      render json: { points: result }, status: 200
    else
      render json: { message: 'Something went wrong, please try another time' }, status: 422
    end
  end

  def update
    if TgtgMicroservice::Requests::RefreshAccess.new(current_user).call
      render json: { message: 'Check your email to accept connection' }, status: :ok
    else
      render json: { message: 'Something went wrong, please try another time' }, status: 422
    end
  end

  # Implement logic related with refreshing token
  # def update
  # end
end