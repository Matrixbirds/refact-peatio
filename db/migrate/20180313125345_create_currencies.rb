class CreateCurrencies < ActiveRecord::Migration[5.1]
  def change
    create_table :currencies do |t|
      t.decimal :balance, :precision => 32, :scale => 16
      t.references :coin, foreign_key: false
      t.decimal :price, :precision => 32, :scale => 16

      t.timestamps
    end
    add_index :currencies, :balance
    add_index :currencies, :price
  end
end
