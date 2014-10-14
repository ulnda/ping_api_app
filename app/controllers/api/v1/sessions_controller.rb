class Api::V1::SessionsController < Api::V1::V1Controller

	def new
		@user = User.create!(phone: params[:phone])
	end

	def create
		user = User.find_by(phone: params[:phone])
		if user && user.authenticate(params[:pin])
			status = :ok
			session[:phone] = params[:phone]
			session[:pin]	= params[:pin]
		else
			status = :unauthorized
		end
		render nothing: true, status: status
	end
end