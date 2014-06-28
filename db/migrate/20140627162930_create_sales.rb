class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :costumer_id
      t.date :fecha_venta
      t.string :book_id

      t.timestamps
    end
  end
end
