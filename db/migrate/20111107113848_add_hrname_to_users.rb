class AddHrnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hrname, :string
  end
end
