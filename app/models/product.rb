class Product < ApplicationRecord
	belongs_to :genre
	attachment :image

	validates :name, presence: true, length: {maximum:30,minimum:2}
	validates :introduction, presence: true, length: {maximum:250,minimum:2}
	validates :price, presence: true
	validates :is_active, presence: true

end
