class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.datetime :check_out_time
      t.integer :customer_id
      t.timestamps null: false
    end
  end
end
