class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_many :cart_items, dependent: :restrict_with_error
end
