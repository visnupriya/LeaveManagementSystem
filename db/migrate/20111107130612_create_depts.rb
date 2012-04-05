class CreateDepts < ActiveRecord::Migration
  def change
    create_table :depts do |t|
      t.string :department
       t.references :user

      t.timestamps
    end
   add_index :depts , :user_id
  end
end
