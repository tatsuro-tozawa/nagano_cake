class Order < ApplicationRecord

	belongs_to :client
	has_many :order_details, dependent: :destroy
	has_many :products, :through => :order_details

	enum payment_method: { クレジットカード: 0, 銀行振込: 1 }

	validates :address, presence: true, length: {maximum: 35, minimum: 2}
	validates :postcode, presence: true, length: {maximum: 10, minimum: 2}
	validates :name, presence: true, length: {maximum: 50, minimum: 3}
end
