class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :nombre
      t.integer :cantidad
      t.float :precio
      t.integer :categoria_id

      t.timestamps
    end
  end
end
