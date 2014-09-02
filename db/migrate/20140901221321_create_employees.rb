class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :sotre_id
      t.string :nombre
      t.string :rfc
      t.string :puesto

      t.timestamps
    end
  end
end
