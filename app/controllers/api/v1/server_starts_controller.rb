# frozen_string_literal: true

module Api
  module V1
    class ServerStartsController < ApplicationController
      skip_before_action :verify_authenticity_token

      # POST api/v1/server_starts
      def create
        server_start = ServerStart.new(time: epoch_to_datetime(params[:time]))
        return server_error unless server_start.save

        return success
      end
    end
  end
end
