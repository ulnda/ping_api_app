class Api::V1::SessionsController < Api::V1::V1Controller
	skip_before_action :authenticate

	def new
		user = User.new(phone: params[:phone])
		status = user.save ? :ok : :bad_request
		render nothing: true, status: status
	end

	def create
		user = User.find_by(phone: params[:phone])
		if user && user.authenticate(params[:pin])
			sign_in(user)
			status = :ok
		else
			status = :unauthorized
		end

		render nothing: true, status: status
	end
end