class OrderItem < ApplicationRecord
  belongs_to :user
  belongs_to :order
  belongs_to :place
end
