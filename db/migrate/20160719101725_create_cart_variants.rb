class CreateCartVariants < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_variants do |t|
      t.integer :quantity
      t.references :cart, foreign_key: true
      t.references :variant, foreign_key: true

      t.timestamps
    end
  end
end
