class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @cart_item = CartItem.create(cart_item_params)
  end

  def destroy
    CartItem.destroy(params[:id])
  end
  private

  def cart_item_params
    params.require(:cart_item).permit(:title, :price, :place_id, :cart_id, :user_id)
  end
end
