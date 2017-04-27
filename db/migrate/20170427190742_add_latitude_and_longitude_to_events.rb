class AddLatitudeAndLongitudeToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :latitude, :decimal, precision: 9, scale: 7, null: false
    add_column :events, :longitude, :decimal, precision: 10, scale: 7, null: false
    add_column :events, :radius, :decimal, null: false
    add_column :events, :address, :string, null: false
  end
end
