class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string      :prefectures,   null: false
      t.string      :city,          null: false
      t.string      :address,       null: false
      t.string      :building
      t.references  :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
