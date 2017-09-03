class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :explanation
      t.string :text
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
