class Place < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :carts, dependent: :destroy
  validates :title, presence: true, length: {maximum: 80}
  validates :description, presence: true, length: {maximum: 80}
  has_attached_file :image,
                    styles: { medium: '320x200!', thumb: '100x100>'},
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image,
                    content_type: ['image/jpeg', 'image/gif', 'image/png']

end
