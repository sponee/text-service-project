require 'rails_helper'

describe InboundTextProcessor do
  describe 'run' do
    let(:message_id)    { '1234' }
    let(:status)        { 'delivered' }
    let!(:text_message) { TextMessage.create!(message_id: message_id, message: 'blah', phone_number: '123456789')}

    it 'updates the status of the TextMessage with the given message_id' do
      expect{
        described_class.run(message_id, status)
      }.to change{
        text_message.reload.status
      }.from(nil).to(status)
    end

    context 'status is invalid' do
      it 'creates a BadPhoneNumber' do
        expect{
          described_class.run(message_id, 'invalid')
        }.to change{
          BadPhoneNumber.count
        }.by(1)
      end
    end
  end
end
