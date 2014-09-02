class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :user_id
      t.string :nombre
      t.string :calle
      t.string :colonia
      t.integer :num_ext
      t.integer :num_int
      t.integer :cp
      t.string :ciudad
      t.string :pais

      t.timestamps
    end
  end
end
