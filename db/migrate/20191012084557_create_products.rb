class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.text :name,                null:false
      t.integer :price,            null:false
      t.text :description,         null:false
      t.integer :status,           null:false
      t.integer :fee,               null:false
      t.integer :shipping_method,   null:false
      t.string :shipping_area,     null: false
      t.integer :shipping_date,     null: false
      t.integer :size
      t.references :buyer,         foreign_key: {to_table: :users}
      t.references :exhibitor,     null: false, foreign_key: {to_table: :users}

      t.timestamps null: false
    end
  end
end
