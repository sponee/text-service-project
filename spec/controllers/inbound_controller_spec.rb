require 'rails_helper'

describe InboundController do
  describe 'POST create' do
    let(:status)     { 'delivered' }
    let(:message_id) { '12345' }

    describe 'success' do
      it 'runs the InboundTextProcessor and returns a 200' do
        expect(InboundTextProcessor).to receive(:run).with(message_id, status) { true }

        post :create, params: { message_id: message_id, status: status }

        expect(response.status).to eq(200)
      end
    end

    describe 'failure' do
      it 'returns a 500' do
        post :create

        expect(response.status).to eq(500)
      end
    end
  end
end
