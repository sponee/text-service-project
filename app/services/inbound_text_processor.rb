class InboundTextProcessor
  attr_accessor :message_id, :status

  def self.run(message_id, status)
    new(message_id, status).process
  end

  def initialize(message_id, status)
    @message_id = message_id
    @status = status
  end

  def process
    text_message ? update_text : false
  end

  private

  def text_message
    @text_message ||= TextMessage.find_by(message_id: message_id)
  end

  def update_text
    text_message.update_attributes!(status: status)
    # if status is invalid, invalidate phone number
    true
  end

end
