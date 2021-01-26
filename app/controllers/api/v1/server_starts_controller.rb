class Api::V1::ServerStartsController < ApplicationController
  skip_before_action :verify_authenticity_token

# POST api/v1/server_starts
  def create
    server_start = ServerStart.new(time: DateTime.strptime(params[:time].to_s,'%s'))
    server_error unless server_start.save

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
