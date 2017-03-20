class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to :back
    else
      flash[:notice] = "Something wrong"
      redirect_to :back
    end
  end

  def destroy
    @cart_item = CartItem.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    else
      flash[:notice] = "Something wrong"
      redirect_to :back
    end
  end
  
  private

  def cart_item_params
    params.require(:cart_item).permit(:title, :price, :place_id, :cart_id, :user_id, :amount)
  end
end
