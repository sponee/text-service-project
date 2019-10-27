class OutboundController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :setup, only: [:create]

  def create
    render_failure("Cannot text a known bad phone number") and return if bad_phone_number?
    ::OutboundTextProcessor.run(@message, @to_number) ? render_success : render_failure("Your message could not be processed")
  end

  private

  def setup
    @message = params["message"]
    @to_number = params["to_number"]
    render_failure("Your message could not be processed") and return unless @message.present? && @to_number.present?
  end

  def render_success
    render json: { message: "Your message is being processed" }, status: 200
  end

  def render_failure(message)
    render json: { message: message }, status: 500
  end

  def bad_phone_number?
    BadPhoneNumber.find_by(phone_number: @to_number)
  end
end
