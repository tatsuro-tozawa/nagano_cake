class Product < ApplicationRecord

	belongs_to :genre
	has_many :cart_products
    has_many :clients, through: :cart_products
    has_many :order_details
    has_many :products, through: :order_details

	attachment :image

	validates :name, presence: true, length: {maximum:30,minimum:2}
	validates :introduction, presence: true, length: {maximum:250,minimum:2}
	validates :price, presence: true
	validates :is_active, presence: true
	validates :image, presence: true

end
