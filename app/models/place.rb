class Place < ApplicationRecord
  has_many :items
  has_many :cart_items
  has_many :carts
  has_attached_file :image,
                    styles: { medium: '320x200!', thumb: '100x100>'},
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image,
                    content_type: ['image/jpeg', 'image/gif', 'image/png']
end
