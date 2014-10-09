class User < ActiveRecord::Base

	validates :phone, presence: true
	validates :pin, presence: true, on: :update

	before_create :set_default_values

	def self.create_new_pin
		p = ""
		6.times { p += Random.rand(6).to_s }
		p.to_i
	end

	private

		def set_default_values
			self.pin = User.create_new_pin
		end
end
