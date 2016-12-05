class CreateEdibles < ActiveRecord::Migration
  def change
    create_table :edibles do |t|

      t.string :name
      t.string :price
      t.timestamps null: false
    end
  end
end
