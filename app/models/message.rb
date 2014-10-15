class Message < ActiveRecord::Base

	MAX_LENGTH = 150

	validates :sender_id, :receiver_id, :text, presence: true
	validates :text, length: { maximum: MAX_LENGTH }

	belongs_to :sender, 	class_name: "User"
	belongs_to :receiver, class_name: "User"
end
