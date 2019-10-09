class CreateUserDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_details do |t|
      t.string      :first_name,       null: false
      t.string      :last_name,        null: false
      t.string      :first_name_kata,  null: false
      t.string      :last_name_kata,   null: false
      t.integer     :birthday,       null: false, defalut: "0"
      t.string      :sms_phone,        null: false, unique: true
      t.string      :postal_code,      null: false
      t.string      :phone
      t.text        :profile
      t.references  :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
