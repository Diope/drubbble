class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates_presence_of :post_id, :user_id
  validates :content, presence:true
end
