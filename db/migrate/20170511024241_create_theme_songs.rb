class CreateThemeSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :theme_songs do |t|

      t.timestamps
    end
  end
end
