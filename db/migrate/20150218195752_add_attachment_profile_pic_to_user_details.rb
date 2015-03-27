class AddAttachmentProfilePicToUserDetails < ActiveRecord::Migration
  def self.up
    change_table :user_details do |t|
      t.attachment :profile_pic
    end
  end

  def self.down
    remove_attachment :user_details, :profile_pic
  end
end
