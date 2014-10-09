require 'spec_helper'

describe User do
  
  let(:user) { create(:user) }

  it { expect(user).to respond_to(:phone) }
  it { expect(user).to respond_to(:pin) }

  it { expect(user).to be_valid  }

  describe 'phone validations' do
  	describe 'presence validation' do
  		before { user.phone = nil }
  		it { expect(user).not_to be_valid }  
  	end
  end

  describe 'pin validations' do
  	describe 'presence validation' do
  		before { user.pin = nil }
  		it { expect(user).not_to be_valid }  
  	end
  end
end
