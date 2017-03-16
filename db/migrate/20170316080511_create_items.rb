class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title
      t.decimal :price
      t.text :description
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
