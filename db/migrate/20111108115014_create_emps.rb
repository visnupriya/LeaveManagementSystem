class CreateEmps < ActiveRecord::Migration
  def change
    create_table :emps do |t|
      t.string :name
      t.string :emailid
      t.string :dateofjoining
      t.string :position
	t.references :dept

      t.timestamps
    end
  add_index :emps, :dept_id
  end
end
