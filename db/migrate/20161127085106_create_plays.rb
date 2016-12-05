class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.integer :transaction_id 	
      t.integer :game_id	
      t.string :quantity_or_duration
      t.timestamps null: false
    end
  end
end
