class CreateConsumes < ActiveRecord::Migration
  def change
    create_table :consumes do |t|

      t.integer :transaction_id
      t.integer :edible_id 
      t.timestamps null: false
    end
  end
end
