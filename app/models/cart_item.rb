class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :place
  belongs_to :cart
end
