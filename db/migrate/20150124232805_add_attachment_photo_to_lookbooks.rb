class AddAttachmentPhotoToLookbooks < ActiveRecord::Migration
  def self.up
    change_table :lookbooks do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :lookbooks, :photo
  end
end
