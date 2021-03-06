class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_many :cart_items, dependent: :destroy

  validates :place_id, presence: true 
  validates :user_id, presence: true

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

  def amount
    cart_items_amount = 0
    self.cart_items.each do |cart_item|
      cart_items_amount = cart_item.amount + cart_items_amount
    end
    cart_items_amount
  end
end
