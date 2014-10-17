class Api::V1::MessagesController < Api::V1::V1Controller

	def create
		receiver = User.find(params[:receiver_id])
		raise ActiveRecord::RecordNotFound unless receiver.authenticated?
		message = Message.new(sender: user, 
													receiver: receiver, 
													text: params[:text], 
													latitude: params[:latitude], 
													longitude: params[:longitude])
		status = message.save ? :ok : :bad_request
		render nothing: true, status: status
	rescue ActiveRecord::RecordNotFound
		render nothing: true, status: :bad_request	
	end
end