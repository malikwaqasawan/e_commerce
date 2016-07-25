class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string  :imageable_type,  index: true
      t.integer :imageable_id,    index: true
      t.timestamps

    end

  end

end
