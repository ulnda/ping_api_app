require 'spec_helper'

describe 'Users' do

	describe 'Contacts' do
		before do
			@contact = build(:contact)
		end

		context 'after authentication' do
			before do
				user = create(:user)
				sign_in(user)
			end

			context 'with contacts' do
				before do 
					@contact.save
					post api_v1_users_contacts_path phones: [@contact.phone]
				end

				it { expect(response.body).to include(@contact.phone) }
			end

			context 'without contacts' do
				before do 
					post api_v1_users_contacts_path, phones: [@contact.phone]
				end

				it { expect(response.body).not_to include(@contact.phone) }
			end
		end

		context 'before authentication' do
			before do
				post api_v1_users_contacts_path, phones: [@contact.phone]				
			end

			it_behaves_like 'access to system without authentication'
		end
	end
end