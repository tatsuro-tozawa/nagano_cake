class Address < ApplicationRecord

	belongs_to :client

	validates :postcode, presence: true, length: {minimum: 2, maximum: 10}
	validates :name, presence: true, length: {minimum: 2, maximum: 35}
	validates :address, presence: true, length: {minimum: 2, maximum: 50}

end
