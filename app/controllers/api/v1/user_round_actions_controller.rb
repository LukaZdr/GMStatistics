# frozen_string_literal: true

module Api
  module V1
    class UserRoundActionsController < ApplicationController
      skip_before_action :verify_authenticity_token

      # POST api/v1/user_round_action/
      def create
        action = build_action(params)
        return server_error unless action.save

        return success
      end

      private
      def build_action(params)
        UserRoundAction::ACTION_TYPES[params['action_type']].build(params, current_round)
      end
    end
  end
end
