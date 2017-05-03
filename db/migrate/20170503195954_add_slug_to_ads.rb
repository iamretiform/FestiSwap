class AddSlugToAds < ActiveRecord::Migration[5.1]
  def change
    add_column :ads, :slug, :string
    add_index :ads, :slug, unique: true
  end
end
