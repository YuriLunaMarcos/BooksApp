class CreateCostumers < ActiveRecord::Migration
  def change
    create_table :costumers do |t|
      t.string :rfc
      t.string :nombre
      t.string :telefono
      t.string :facebook
      t.string :diraccion
      t.string :linkedin
      t.string :correoE

      t.timestamps
    end
  end
end
