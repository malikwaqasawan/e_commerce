class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.float :cost
      t.date :order_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
