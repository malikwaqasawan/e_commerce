class RemoveColumnTypeFromOrderItems < ActiveRecord::Migration[5.0]
  def change
  	remove_column :order_items, :type, :string
  end
end
