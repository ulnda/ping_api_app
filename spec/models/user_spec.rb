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
      it { expect(User.contacts([contact.phone])).to include(contact.phone) }
    end

    context 'without contacts' do
     let(:phone) { contact.phone }

      context 'empty contacts' do
        before { contact.destroy }

        it { expect(User.contacts([phone])).not_to include(phone) }
      end

      context 'not activated contacts' do
        before { contact.update(authenticated: false) }

        it { expect(User.contacts([phone])).not_to include(phone) }
      end
    end
  end
end
