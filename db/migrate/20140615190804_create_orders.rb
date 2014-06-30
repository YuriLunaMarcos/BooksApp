class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :usuario_id
      t.integer :cliente_id
      t.datetime :fechaPedido
      t.datetime :fechaEntrega
      t.datetime :fechaRealEntrega
      t.string :estado

      t.timestamps
    end
  end
end
