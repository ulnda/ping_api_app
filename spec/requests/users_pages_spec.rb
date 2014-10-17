require 'spec_helper'

describe 'Users' do

	let(:contact) { build(:contact) }
	let(:user) { create(:user) }

	describe 'Contacts' do

		context 'after authentication' do
			before { sign_in(user) }

			context 'with contacts' do
				before do 
					contact.save
					post api_v1_users_contacts_path phones: [contact.phone]
				end
				
				it { expect(response.body).to include(contact.phone) }
			end

			context 'without contacts' do
				before { post api_v1_users_contacts_path, phones: [contact.phone] }
				it { expect(response.body).not_to include(contact.phone) }
			end
		end

		context 'before authentication' do
			before { post api_v1_users_contacts_path, phones: [contact.phone] }
			it_behaves_like 'access to system without authentication'
		end
	end
end