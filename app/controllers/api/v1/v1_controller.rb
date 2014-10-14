class Api::V1::V1Controller < Api::ApiController
	include V1::SessionsHelper

	before_action :authenticate

	private

		def authenticate
			render nothing: true, status: :unauthorized unless signed_in?
		end
end
