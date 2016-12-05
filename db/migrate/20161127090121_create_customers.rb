class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|

      t.string :full_name
      t.string :serial_no
      t.timestamps null: false
    end
  end
end
