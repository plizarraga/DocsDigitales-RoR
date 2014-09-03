class ChangeNameStoreIdToEmployees < ActiveRecord::Migration
  def change
  	rename_column :employees, :sotre_id, :store_id
  end
end
