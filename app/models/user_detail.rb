class UserDetail < ActiveRecord::Base
  belongs_to :user
  has_attached_file :profile_pic
end
