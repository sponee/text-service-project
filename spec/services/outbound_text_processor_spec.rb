require 'rails_helper'

describe OutboundTextProcessor do
  let(:message)   { 'gotta catch em all' }
  let(:to_number)  { '1511511511' }
  let(:message_id) { '123-456-789' }

  before do
    allow_any_instance_of(OutboundTextProcessor).to receive(:send_text).with(any_args) { { message_id: message_id }.to_json }
  end

  describe 'run' do
    it 'creates a new TextMessage' do
      expect{
        described_class.run(message, to_number)
      }.to change{
        TextMessage.count
      }.by(1)
    end
  end
end
