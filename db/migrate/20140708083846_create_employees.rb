class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
