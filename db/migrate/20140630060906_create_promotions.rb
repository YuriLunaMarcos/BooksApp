class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.date :Fecha
      t.integer :Cliente
      t.string :Medio
      t.text :Descripcion
      t.string :Empleado

      t.timestamps
    end
  end
end
