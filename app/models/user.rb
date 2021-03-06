class User < ApplicationRecord
  has_many :cart_items
  has_many :carts
  has_many :orders, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def role?(r)
  	role.include? r.to_s
	end
	
  def orders_total
    total = 0
    orders.each do |order|
      total = order.total + total
    end
    total
  end
end
