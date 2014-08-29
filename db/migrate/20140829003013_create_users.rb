class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :correo_electronico
      t.string :rfc
      t.string :empresa
      t.string :contrasena_hash
      t.string :contrasena_salt

      t.timestamps
    end
  end
end
