class User < ApplicationRecord
  has_many :cart_items
  has_many :carts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def role?(r)
  	role.include? r.to_s
	end
	
end
