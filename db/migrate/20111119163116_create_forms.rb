class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :leavetype
      t.string :from
      t.string :to
      t.text :reason
      t.string :emp_name 
      t.string :emp_emailid
      t.references :emp
      t.references :admin
      t.timestamps
    end
  
  end
end
