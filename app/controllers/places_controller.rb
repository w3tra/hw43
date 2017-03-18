class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
    if user_signed_in?
      @cart_item = CartItem.new
      if current_user.carts.where(place: @place).last.nil?
        @place_cart = Cart.create(user: current_user, place: @place)
      else
        @place_cart = current_user.carts.where(place: @place).last
      end
    end
  end
end
