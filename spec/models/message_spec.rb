require 'spec_helper'

describe Message do

  let(:message)  { create(:message) }

  it { expect(message).to respond_to(:sender) }
  it { expect(message).to respond_to(:sender_id) }

  it { expect(message).to respond_to(:receiver) }
  it { expect(message).to respond_to(:receiver_id) }

  it { expect(message).to respond_to(:text) }

  it { expect(message).to respond_to(:latitude) }
  it { expect(message).to respond_to(:longitude) }

  it { expect(message).to be_valid }

  describe 'validations' do
    describe 'sender validations' do
    	describe 'presence validation' do
    		before { message.sender = nil }
    		it { expect(message).not_to be_valid }  
    	end
    end

    describe 'receiver validations' do
    	describe 'presence validation' do
    		before { message.receiver = nil }
    		it { expect(message).not_to be_valid }  
    	end
    end

    describe 'text validations' do
    	describe 'presence validation' do
    		before { message.text = nil }
    		it { expect(message).not_to be_valid }  
    	end

    	describe 'length validation' do
    		before { message.text = "A" * (Message::MAX_LENGTH + 1) }
    		it { expect(message).not_to be_valid } 
    	end
    end
  end
end
