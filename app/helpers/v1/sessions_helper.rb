module V1::SessionsHelper

	def sign_in(user)
		session[:phone] = params[:phone]
		session[:pin]		= params[:pin]

		user.toggle!(:authenticated) unless user.authenticated
	end

	def signed_in?
		user && user.authenticate(session[:pin]) && user.authenticated?
	end

	def user
		@user ||= User.find_by(phone: session[:phone])
	end
end
