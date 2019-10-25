class OutboundTextProcessor
  attr_accessor :message, :to

  def self.run(message, to)
    new(message, to).process_response
  end

  def initialize(message, to)
    @message = message
    @to = to
  end

  def process_response
    response = JSON.parse(send_text)
    return response["message_id"] ? create_text(response["message_id"]) : false
  end

  private

  def send_text
    `curl -X POST -H "Content-Type: application/json" -d '{"to_number": "#{to}", "message": "#{message}", "callback_url": "https:/example.com"}' "https://jo3kcwlvke.execute-api.us-west-2.amazonaws.com/dev/provider1"`
  end

  def create_text(message_id)
    TextMessage.create!(phone_number: to, message: message, message_id: message_id)
  end
end
