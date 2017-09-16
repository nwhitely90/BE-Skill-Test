class AddSiteUrlToSites < ActiveRecord::Migration[5.1]
  def change
    add_column :sites, :site_url, :string
  end
end
