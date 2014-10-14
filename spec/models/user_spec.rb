require 'spec_helper'

describe User do
  
  let(:user)    { create(:user) }
  let(:contact) { create(:contact) }

  it { expect(user).to respond_to(:phone) }
  it { expect(user).to respond_to(:pin) }

  it { expect(user).to be_valid  }

  describe 'validations' do
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

  describe 'contacts' do
    context 'with contacts' do
      it 'include contact' do
        expect(User.contacts([contact.phone])).to include(contact.phone)
      end
    end

    context 'without contacts' do
      it 'does not include contact' do
        phone = contact.phone
        contact.destroy
        expect(User.contacts([contact.phone])).not_to include(phone)
      end
    end
  end
end
