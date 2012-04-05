class FixToken < ActiveRecord::Migration
  def up
    rename_column :admins,:email ,:token
  end

  def down
  end
end
