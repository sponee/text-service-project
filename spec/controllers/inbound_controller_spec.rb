require 'rails_helper'

describe InboundController do
  describe 'POST create' do
    let(:message_id) { '12345' }

    describe 'success' do
      let!(:text_message) { TextMessage.create!(phone_number: '8675309', message: 'passing grade', message_id: message_id) }

      it 'updates the text message\'s status and returns a 200' do
        expect{
          post :create, params: { message_id: message_id, status: 'delivered' }
        }.to change{
          text_message.reload.status
        }.from(nil).to('delivered')
        expect(response.status).to eq(200)
      end
    end

    describe 'failure' do
      it 'returns a 500' do
        post :create, params: { message_id: message_id, status: 'delivered' }
        expect(response.status).to eq(500)
      end
    end
  end
end
