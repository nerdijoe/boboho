class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :username
      t.string :email
      t.string :phone
      t.string :address
      t.string :city
      t.string :country
      t.string :zipcode
      t.string :profile_pic

      t.string :password
      t.string :password_confirmation
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
