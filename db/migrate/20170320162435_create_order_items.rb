class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.references :user, foreign_key: true
      t.references :order, foreign_key: true
      t.references :place, foreign_key: true
      t.string :title
      t.decimal :price
      t.integer :amount

      t.timestamps
    end
  end
end
