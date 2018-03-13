class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :state
      t.integer :is_locked
      t.references :creator, foreign_key: false
      t.decimal :price, :precision => 32, :scale => 16
      t.integer :currency_id

      t.timestamps
    end
    add_index :orders, :state
    add_index :orders, :price
    add_index :orders, :currency_id
  end
end
