class CreateDetailSales < ActiveRecord::Migration
  def change
    create_table :detail_sales do |t|
      t.integer :sale_id
      t.integer :cantidad
      t.decimal :precio
      t.string :descuento
      t.decimal :total

      t.timestamps
    end
  end
end
