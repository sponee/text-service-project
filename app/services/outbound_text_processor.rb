class OutboundTextProcessor
  attr_accessor :message, :to_number

  def self.run(message, to_number)
    new(message, to_number).process
  end

  def initialize(message, to_number)
    @message = message
    @to_number = to_number
  end

  def process
    response = JSON.parse(send_text)
    return response["message_id"] ? create_text(response["message_id"]) : false
  end

  private

  def send_text
    `curl -X POST -H "Content-Type: application/json" -d '{"to_number": "#{to_number}", "message": "#{message}", "callback_url": "https://obscure-brook-05265.herokuapp.com/inbound"}' "https://jo3kcwlvke.execute-api.us-west-2.amazonaws.com/dev/provider1"`
  end

  def create_text(message_id)
    TextMessage.create!(phone_number: to_number, message: message, message_id: message_id)
  end
end
