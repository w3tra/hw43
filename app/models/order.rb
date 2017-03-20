class Order < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_many :order_items, dependent: :destroy

  def total
  	unless self.order_items.nil?
  		order_total = 0
  		self.order_items.each do |order_item|
  			order_item_total = order_item.amount * order_item.price
  			order_total = order_total + order_item_total
  		end
  		order_total
  	end
  end

  def amount
    order_items_amount = 0
    self.order_items.each do |order_item|
      order_items_amount = order_item.amount + order_items_amount
    end
    order_items_amount
  end
end
