class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :site, foreign_key: true
      t.string :amazon_id
      t.integer :price
      t.string :image_name
      t.text :title
      t.text :description
      t.string :active
      t.string :boolean

      t.timestamps
    end
  end
end
