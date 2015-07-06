class Post < ActiveRecord::Base
  validates_presence_of :user_id
  validates :title, :content, presence: true
  validates_length_of :content, minimum: 1, maximum: 140

  belongs_to :user
end
