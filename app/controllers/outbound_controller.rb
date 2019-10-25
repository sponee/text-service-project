class OutboundController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    render status: 200
  end
end
