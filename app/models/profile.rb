class Profile < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id

  has_attached_file :avatar, :styles => {:medium => "160x160>"}, :default_url => "/images/:style/default_avatar.gif"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  scope :desc_order, -> { order("created_at DESC") }


end
