class Order < ApplicationRecord

	belongs_to :client
	has_many :order_details, dependent: :destroy
	has_many :products, :through => :order_details

	enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
	enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }

	validates :address, presence: true, length: {maximum: 35, minimum: 2}
	validates :postcode, presence: true, length: {maximum: 10, minimum: 2}
	validates :name, presence: true, length: {maximum: 50, minimum: 3}
end
