class TextMessagesController < ApplicationController

  def index
    @text_messages = TextMessage.all
  end
end
