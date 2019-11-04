class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.text :name,                null:false
      t.integer :price,            null:false
      t.text :description,         null:false
      t.integer :status,           null:false
      t.string :charge,            null:false
      t.string :shipping_method,   null:false
      t.string :shipping_area,     null: false
      t.string :shipping_date,     null: false
      t.string :size
      t.references :buyer,         foreign_key: {to_table: :users}
      t.references :exhibitor,     null: false, foreign_key: {to_table: :users}

      t.timestamps null: false
    end
  end
end
