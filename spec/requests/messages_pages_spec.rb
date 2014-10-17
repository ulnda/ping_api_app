require 'spec_helper'

describe 'Messages' do

	ATTEMPT_TO_CREATE_A_NEW_MESSAGE_WITH_INVALIND_PARAMS_SPEC = 'attempt to create a new message with invalid params'
	MESSAGE_TEXT = 'Some text'
	
	let(:contact) { create(:contact) }
	let(:user) { create(:user) }

	describe 'Create' do

		context 'after authentication' do
			before { sign_in(user) }

			context 'with valid params' do
				before { post api_v1_messages_path, receiver_id: contact.id, text: MESSAGE_TEXT }

				it { expect(response.status).to eq(200) }	
				it { expect(Message.all.size).to eq(1) }			
			end

			context 'with invalid params' do

				context 'with empty text' do
					before { post api_v1_messages_path, receiver_id: contact.id }
					it_behaves_like ATTEMPT_TO_CREATE_A_NEW_MESSAGE_WITH_INVALIND_PARAMS_SPEC
				end

				context 'with not existing receiver' do
					before do 
						contact.destroy
						post api_v1_messages_path, receiver_id: contact.id, text: MESSAGE_TEXT
					end

					it_behaves_like ATTEMPT_TO_CREATE_A_NEW_MESSAGE_WITH_INVALIND_PARAMS_SPEC
				end

				context 'with not authenticated receiver' do
					before do 
						contact.update(authenticated: false)
						post api_v1_messages_path, receiver_id: contact.id, text: MESSAGE_TEXT
					end

					it_behaves_like ATTEMPT_TO_CREATE_A_NEW_MESSAGE_WITH_INVALIND_PARAMS_SPEC				
				end
			end
		end

		context 'before authentication' do
			before { post api_v1_messages_path, receiver_id: user.id, text: MESSAGE_TEXT }
			it_behaves_like 'access to system without authentication'
		end
	end
end