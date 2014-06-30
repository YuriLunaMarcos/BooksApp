class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :costumer_id
      t.date :fecha_venta
     

      t.timestamps
    end
  end
end
