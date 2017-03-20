class CartsController < ApplicationController
  before_action :authenticate_user!

  def create
    @cart = Cart.create(cart_params)
  end

  def destroy
    @cart = Cart.find(params[:id])
    if @cart.destroy
      redirect_to :back
      flash[:notice] = "Order successfully created(No)"
    else
      flash[:notice] = "Something wrong"
      redirect_to :back
    end
  end

  private

  def cart_params
    params.require(:cart).permit(:user, :place)
  end
end
