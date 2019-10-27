require 'rails_helper'

describe OutboundController do
  describe 'POST create' do
    let(:message)                 { 'Jenny, I got your number' }
    let(:to_number)               { '867-5309' }
    let(:success_message)         { 'Your message is being processed' }
    let(:generic_failure_message) { 'Your message could not be processed' }
    let(:bad_number_message)      { 'Cannot text a known bad phone number' }

    context 'success' do  
      it 'runs the OutboundTextProcessor with the given message and to_number' do
        expect(OutboundTextProcessor).to receive(:run).with(message, to_number) { true }

        post :create, params: { to_number: to_number, message: message }
      end

      it 'renders a 200 and explains why' do
        expect(OutboundTextProcessor).to receive(:run).with(message, to_number) { true }

        post :create, params: { to_number: to_number, message: message }

        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)['message']).to eq(success_message)
      end
    end

    context 'failure' do
      context 'generic failure' do
        it 'renders a 500 and explains why' do
          post :create

          expect(response.status).to eq(500)
          expect(JSON.parse(response.body)['message']).to eq(generic_failure_message)
        end
      end

      context 'failure due to BadPhoneNumber' do
        before { BadPhoneNumber.create!(phone_number: to_number) }

        it 'renders a 500 and explains why' do
          post :create, params: { to_number: to_number, message: message }

          expect(response.status).to eq(500)
          expect(JSON.parse(response.body)['message']).to eq(bad_number_message)
        end
      end
    end
  end
end
