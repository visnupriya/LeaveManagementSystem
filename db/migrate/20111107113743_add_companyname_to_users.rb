class AddCompanynameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :companyname, :string
  end
end
