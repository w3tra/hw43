class Item < ApplicationRecord
  belongs_to :place
  validates :place_id, presence: true
  validates :title, 	 presence: true, length: {maximum: 80}
  validates :price,    presence: true
  validates_numericality_of :price, :greater_than_or_equal_to => 1
end
