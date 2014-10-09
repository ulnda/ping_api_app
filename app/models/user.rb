class User < ActiveRecord::Base
	validates :phone, presence: true
end
