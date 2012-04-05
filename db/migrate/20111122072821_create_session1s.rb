class CreateSession1s < ActiveRecord::Migration
  def change
    create_table :session1s do |t|

      t.timestamps
    end
  end
end
