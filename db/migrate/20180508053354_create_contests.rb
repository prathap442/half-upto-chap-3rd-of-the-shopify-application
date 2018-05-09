class CreateContests < ActiveRecord::Migration[5.2]
  def change
    create_table :contests do |t|
      t.string :name
      t.datetime :start_date
      t.integer :product_id,limit: 8
      t.datetime :end_date
      t.integer :max_results
      t.integer :order_id
      t.timestamps
    end
    add_index :contests, :order_id
  end
end
