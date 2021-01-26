class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

# POST api/v1/users
  def create
    @user = User.find_by_steam_id.first_or_create(user_params)
    debugger
    if @user.save
      render json: @user, status: :success
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

 private
  def user_params
    params.require(:user).permit(:name, :steam_id)
  end
end