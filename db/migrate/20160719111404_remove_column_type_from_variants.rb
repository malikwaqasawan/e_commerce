class RemoveColumnTypeFromVariants < ActiveRecord::Migration[5.0]
  def change
  	remove_column :variants, :type
  end
end
