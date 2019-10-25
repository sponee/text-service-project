require 'rails_helper'

describe TextMessage do
  describe 'validations' do
    let!(:subject) { described_class.new }

    it { should validate_presence_of(:phone_number) }
    it { should validate_presence_of(:message) }
    it { should validate_presence_of(:message_id) }
    it { should validate_uniqueness_of(:message_id) }

  end
end
