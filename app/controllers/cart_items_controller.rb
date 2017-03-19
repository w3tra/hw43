class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @cart_item = CartItem.create(cart_item_params)
    redirect_to :back
  end

  def destroy
    CartItem.destroy(params[:id])
    redirect_to :back
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
  end
  private

  def cart_item_params
    params.require(:cart_item).permit(:title, :price, :place_id, :cart_id, :user_id, :amount)
  end
end
