class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.string :name
      t.integer :quantity
      t.float :price
      t.string :type
      t.references :order, foreign_key: true
      t.references :variant, foreign_key: true

      t.timestamps
    end
  end
end
