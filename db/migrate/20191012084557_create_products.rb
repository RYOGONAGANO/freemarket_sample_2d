class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.text :name,                null:false
      t.integer :price,            null:false
      t.text :description,         null:false
      t.integer :status,           null:false, default: "0"
      t.integer :fee,               null:false, default: "0"
      t.integer :shipping_method,   null:false, default: "0"
      t.string :shipping_area,      null: false, default: "0"
      t.integer :shipping_date,     null: false, default: "0"
      t.integer :size,              default: "0"
      t.references :buyer,         foreign_key: {to_table: :users}
      t.references :exhibitor,     null: false, foreign_key: {to_table: :users}

      t.timestamps null: false
    end
  end
end
