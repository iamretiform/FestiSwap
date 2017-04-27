class AddAttachmentAvatarToEvents < ActiveRecord::Migration[5.1]
  def self.up
    change_table :events do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :events, :file
  end
end
