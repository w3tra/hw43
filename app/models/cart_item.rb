class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :place
  belongs_to :cart

  validates :place_id, presence: true 
  validates :user_id,  presence: true
  validates :cart_id,  presence: true
  validates :title, 	 presence: true
  validates :price,    presence: true
  validates :amount,   presence: true
  validates_numericality_of :amount, :greater_than_or_equal_to => 1
  def total
    price * amount
  end
end
