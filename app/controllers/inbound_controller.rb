class InboundController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :setup, only: [:create]

  def create
    Rails.logger.info(params)
    ::InboundTextProcessor.run(@message_id, @status) ? render_success : render_failure
  end

  private

  def setup
    @message_id = params["message_id"]
    @status = params["status"]
    render_failure and return unless @message_id.present? && @status.present?
  end

  def render_success
    render json: {}, status: 200
  end

  def render_failure
    render json: {}, status: 500
  end
end
