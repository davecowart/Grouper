class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_salt
      t.string :gender
      t.string :persistence_token, :null => false
      t.string :crypted_password, :null => false

      t.timestamps
    end
  end
end
