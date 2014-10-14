class Api::V1::SessionsController < Api::V1::V1Controller

	def new
		user = User.new(phone: params[:phone])
		status = user.save ? :ok : :bad_request
		render nothing: true, status: status
	end

	def create
		user = User.find_by(phone: params[:phone])
		if user && user.authenticate(params[:pin])
			user.toggle!(:authenticated)

			status = :ok
			session[:phone] = params[:phone]
			session[:pin]	= params[:pin]
		else
			status = :unauthorized
		end

		render nothing: true, status: status
	end
end