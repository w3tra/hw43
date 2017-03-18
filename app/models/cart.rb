class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_many :cart_items, dependent: :destroy
end
