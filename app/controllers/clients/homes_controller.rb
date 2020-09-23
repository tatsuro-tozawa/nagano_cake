class Clients::HomesController < ApplicationController

   def top
   	@products = Product.all.includes(:genre).where(genres: {is_active: true}).page(params[:page]).reverse_order
   	@genres = Genre.where(is_active: true)
   end

   def about
   end

end
