require 'spec_helper'

describe 'Authentication' do

	describe 'Signup' do
		context 'with invalid information' do
			before { post api_v1_signup_path }
			it { expect(response.status).to eq(400) }
		end

		context 'with valid information' do
			before { post api_v1_signup_path, phone: "+79020000000" }
			it { expect(response.status).to eq(200) }
		end
	end

	describe 'Signin' do
		context 'with invalid information' do
			before { post api_v1_signin_path }
			it { expect(response.status).to eq(401) }			
		end

		context 'with valid information' do
			before do
				@user = create(:user)
				post api_v1_signin_path, phone: @user.phone, pin: @user.pin
			end

			it { expect(response.status).to eq(200) }
			it { expect(@user.reload.authenticated).to eq(true) }
		end
	end
end