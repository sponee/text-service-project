require 'rails_helper'

describe OutboundController do
  describe 'POST create' do
    context 'failure' do
      it 'renders a 500 and explains why' do
        post :create
        expect(response.status).to eq(500)
        expect(JSON.parse(response.body)["message"]).to eq("Your message could not be processed")
      end
    end

    context 'success' do
      before { allow(OutboundTextProcessor).to receive(:run).with(any_args) { true } }

      it 'renders a 200 and explains why' do
        post :create, params: { to_number: "867-5309", message: "Jenny, I got your number" }
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)["message"]).to eq("Your message is being processed")
      end
    end
  end
end
