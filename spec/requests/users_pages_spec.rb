require 'spec_helper'

describe 'Users' do

	describe 'Contacts' do
		context 'with contacts' do
			before do 
				@contact = create(:contact)
				post api_v1_users_contacts_path phones: [@contact.phone]
			end

			it { expect(response.body).to include(@contact.phone) }
		end

		context 'without contacts' do
			before do 
				@contact = build(:contact)
				post api_v1_users_contacts_path, phones: [@contact.phone]
			end

			it { expect(response.body).not_to include(@contact.phone) }
		end
	end
end