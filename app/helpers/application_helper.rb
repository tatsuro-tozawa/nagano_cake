module ApplicationHelper

	def price_non_taxed(price)
		price = price / 1.1
		"#{price.round}円"
	end

	def flash_class_for flash_type
	    case flash_type
		    when 'success' then 'alert-success'
		    when 'danger' then 'alert-danger'
		    when 'info' then 'alert-info'
		end
	end
end
