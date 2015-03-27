class AddAttachmentAudioToLookbooks < ActiveRecord::Migration
  def self.up
    change_table :lookbooks do |t|
      t.attachment :audio
    end
  end

  def self.down
    remove_attachment :lookbooks, :audio
  end
end
