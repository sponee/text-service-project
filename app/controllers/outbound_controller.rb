class OutboundController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    render_failure and return unless setup
    ::OutboundTextProcessor.run(@message, @to_number) ? render_success : render_failure
  end

  private

  def setup
    @message = params["message"]
    @to_number = params["to_number"]
    @message.present? && @to_number.present?
  end

  def render_success
    render json: { message: "Your message is being processed"}, status: 200
  end

  def render_failure
    render json: { message: "Your message could not be processed" }, status: 500
  end
end
