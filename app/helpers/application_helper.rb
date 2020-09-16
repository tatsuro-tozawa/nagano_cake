module ApplicationHelper
	def price_non_taxed(price)
		price = price / 1.1
		"#{price.round}円"
	end
end
