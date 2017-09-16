class AddImageToSites < ActiveRecord::Migration[5.1]
  def change
    add_column :sites, :image, :string
  end
end
