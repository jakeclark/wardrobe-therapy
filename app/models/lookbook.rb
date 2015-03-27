class Lookbook < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_and_belongs_to_many :books
  Paperclip.options[:command_path] = 'C:/Program Files/ImageMagick-6.9.0-Q16'

  has_attached_file :photo, :styles => { :small => "150x150" , :medium => "250x250"}
  has_attached_file :photo_extra, :styles => { :small => "150x150" , :medium => "250x250"}

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :photo_extra, :content_type => /\Aimage\/.*\Z/
  #validates_attachment_content_type :photo, :content_type => %w(image/jpeg image/jpg)
  #validates_attachment_content_type :photo_extra, :content_type => %w(image/jpeg image/jpg)
  #validates_attachment_content_type :audio, :content_type => %w(audio/mpeg audio/mp3)

  #validates_attachment_content_type :audio, :content_type => [ 'audio/MP3' ]
  #validates_attachment_size :audio, :less_than => 20.megabytes

  has_attached_file :audio


end
