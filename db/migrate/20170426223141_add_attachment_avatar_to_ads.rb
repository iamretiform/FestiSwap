class AddAttachmentAvatarToAds < ActiveRecord::Migration[5.1]
  def self.up
    change_table :ads do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :ads, :file
  end
end
