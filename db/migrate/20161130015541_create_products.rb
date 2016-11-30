class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :id_laboratorio
      t.string :nombre
      t.integer :precio_compra
      t.string :imagen

      t.timestamps
    end
  end
end
