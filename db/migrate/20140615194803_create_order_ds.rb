class CreateOrderDs < ActiveRecord::Migration
  def change
    create_table :order_ds do |t|
      t.integer :order_id
      t.integer :product_id
      t.text :acuerdo
      t.string :estado
      t.integer :cantidad
      t.float :desceuento
      t.float :precioUnitario
      t.float :importeTotal

      t.timestamps
    end
  end
end
