class OrderItem < ApplicationRecord
  belongs_to :user
  belongs_to :order
  belongs_to :place

  def total
    price * amount
  end
end
