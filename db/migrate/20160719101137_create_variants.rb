class CreateVariants < ActiveRecord::Migration[5.0]
  def change
    create_table :variants do |t|
      t.string :type
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
