class OutboundTextProcessor
  attr_accessor :message, :to_number, :provider

  PROVIDER_ONE = "https://jo3kcwlvke.execute-api.us-west-2.amazonaws.com/dev/provider1"
  PROVIDER_TWO = "https://jo3kcwlvke.execute-api.us-west-2.amazonaws.com/dev/provider2"

  def self.run(message, to_number)
    new(message, to_number).process
  end

  def initialize(message, to_number)
    @message = message
    @to_number = to_number
    @provider = @provider = rand(1..100) > 30 ? PROVIDER_ONE : PROVIDER_TWO
  end

  def process
    process_response(JSON.parse(send_text(provider))) ? true : process_response(JSON.parse(send_text(other_provider)))
  end

  private

  def process_response(response)
    response["message_id"] ? create_text(response["message_id"]) : false
  end

  def send_text(provider)
    `curl -X POST -H "Content-Type: application/json" -d '{"to_number": "#{to_number}", "message": "#{message}", "callback_url": "https://obscure-brook-05265.herokuapp.com/inbound"}' "#{provider}"`
  end

  def create_text(message_id)
    TextMessage.create!(phone_number: to_number, message: message, message_id: message_id)
  end

  def other_provider
    @provider == PROVIDER_ONE ? PROVIDER_TWO : PROVIDER_ONE
  end
end
