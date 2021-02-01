# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :verify_authenticity_token

      # POST api/v1/users
      def create
        user = User.where(steam_id: params['user']['steam_id']).first_or_initialize
        return server_error unless user.update(name: params['user']['name'])

        login_time = LoginTime.new(user: user, login: epoch_to_datetime(params['time']))
        return server_error unless login_time.save

        return success
      end

      def logout
        user = User.find_by_steam_id(params['user']['steam_id'])
        return server_error unless user.current_login.update(logout: epoch_to_datetime(params['time']),
                                                  logout_reason: params['user']['reason'])
        return success
      end
    end
  end
end
