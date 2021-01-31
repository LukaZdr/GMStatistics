class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

# POST api/v1/users
  def create
    user = User.where(steam_id: params['user']['steam_id']).first_or_initialize
    server_error unless user.update(name: params['user']['name'])

    login_time = LoginTime.new(user: user, login: epoch_to_datetime(params['time']))
    server_error unless login_time.save

    success
  end


  def logout
    user = User.find_by_steam_id(params['user']["steam_id"])
    server_error if user.current_login.update(logout: epoch_to_datetime(params['time']),
                                              logout_reason: params['user']['reason'])
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
