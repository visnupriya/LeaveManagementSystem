class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :emp_name
      t.string :emp_emailid
      t.references :emp

      t.timestamps
    end
  end
end
