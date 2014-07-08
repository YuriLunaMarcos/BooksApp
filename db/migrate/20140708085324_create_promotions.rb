class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.integer :costumer_id
      t.integer :employee_id
      t.date :fecha
      t.text :descripcion

      t.timestamps
    end
  end
end
