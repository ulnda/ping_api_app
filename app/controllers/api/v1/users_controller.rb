class Api::V1::UsersController < Api::V1::V1Controller

	def contacts
		@contacts = User.contacts(params[:phones])
	end
end