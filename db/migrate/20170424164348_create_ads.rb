class CreateAds < ActiveRecord::Migration[5.1]
  def change
    create_table :ads do |t|
      t.references :event, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
