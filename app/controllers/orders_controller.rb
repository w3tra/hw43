class OrdersController < ApplicationController
	before_action :authenticate_user!

	def create
		@cart = Cart.find(params[:cart])
		@order = Order.new(user: @cart.user, place: @cart.place)
		if @order.save
	    @cart.cart_items.each do |cart_item|
	    	OrderItem.create(
	    									title:  cart_item.title,
	    									place:  cart_item.place,
	    									user:   cart_item.user,
	    									order:  @order,
	    									price:  cart_item.price,
	    									amount: cart_item.amount
	    										)
	    end
	    @cart.destroy
	    flash[:notice] = "Order successfully created"
	    redirect_to :back
	   else
	   	flash[:notice] = "Something wrong"
      redirect_to :back
     end
	end

	def index
		@orders = current_user.orders
	end

	def show
		@order = Order.find(params[:id])
	end
end
