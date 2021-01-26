class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

# POST api/v1/users
  def create
    user = User.where(steam_id: params['user']['steam_id']).first_or_initialize(name: params['user']['name'])
    server_error unless user.save

    login_time = LoginTime.create!(user: user, time: DateTime.strptime(params[:time].to_s,'%s'))
    server_error unless login_time.save

    success
  end

 private
  def server_error
    render :nothing => true, :status => :internal_server_error
  end

  def success
    render :nothing => true, :status => :ok
  end
end
