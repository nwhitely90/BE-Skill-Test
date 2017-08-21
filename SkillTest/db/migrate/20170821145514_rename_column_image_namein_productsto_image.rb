class RenameColumnImageNameinProductstoImage < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :image_name, :image
  end
end
