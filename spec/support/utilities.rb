include ApplicationHelper

def sign_in(user)
	post api_v1_signin_path, phone: user.phone, pin: user.pin
end
