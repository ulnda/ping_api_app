class User < ActiveRecord::Base

	validates :phone, presence: true
	validates :pin,   presence: true, on: :update

	before_create :set_default_values

	scope :contacts, ->(phones) { where(phone: phones, authenticated: true).pluck(:phone) }

	def self.create_new_pin
		(1..6).map { Random.rand(9).to_s }.join("").to_i
	end

	def authenticate(pin)
		self.pin == pin.to_i
	end

	private

		def set_default_values
			self.pin = User.create_new_pin
		end
end
