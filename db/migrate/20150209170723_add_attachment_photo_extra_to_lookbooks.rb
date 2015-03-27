class AddAttachmentPhotoExtraToLookbooks < ActiveRecord::Migration
  def self.up
    change_table :lookbooks do |t|
      t.attachment :photo_extra
    end
  end

  def self.down
    remove_attachment :lookbooks, :photo_extra
  end
end
