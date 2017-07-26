class AddThemeSongColumnToEvents < ActiveRecord::Migration[5.1]
  def change
    add_attachment :events, :theme_song
  end
end

