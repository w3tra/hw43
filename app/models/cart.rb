class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_many :cart_items, dependent: :destroy

  def total
  	unless self.cart_items.nil?
  		cart_total = 0
  		self.cart_items.each do |cart_item|
  			cart_item_total = cart_item.amount * cart_item.price
  			cart_total = cart_total + cart_item_total
  		end
  		cart_total
  	end
  end
end
