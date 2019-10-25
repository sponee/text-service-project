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
    text_message ? handle_updates : false
  end

  private

  def text_message
    @text_message ||= TextMessage.find_by(message_id: message_id)
  end

  def handle_updates
    text_message.update_attributes!(status: status)
    record_bad_number if status == 'invalid'
    true
  end

  def record_bad_number
    BadPhoneNumber.create(phone_number: text_message.phone_number)
  end
end
