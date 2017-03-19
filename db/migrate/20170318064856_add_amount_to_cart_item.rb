class AddAmountToCartItem < ActiveRecord::Migration[5.0]
  def change
    add_column :cart_items, :amount, :integer, default: 1
  end
end
