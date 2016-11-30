class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.integer :id_usuario
      t.string :producto
      t.datetime :fecha_vencimiento
      t.integer :cantidad

      t.timestamps
    end
  end
end
