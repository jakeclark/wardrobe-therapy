class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :lookbooks
  has_one :user_detail
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  accepts_nested_attributes_for :roles

  acts_as_followable
  acts_as_follower

  # Setup accessible (or protected) attributes for your model

end
