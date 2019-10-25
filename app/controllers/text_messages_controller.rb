class TextMessagesController < ApplicationController
  before_action :get_text_messages, :filter_results

  def index
  end

  private

  def get_text_messages
    @text_messages = TextMessage.all
  end

  def filter_results
    @phone_number = params[:phone_number]
    @text_messages = @text_messages.where("phone_number LIKE ?", "%#{@phone_number}%") if @phone_number.present?
  end
end
