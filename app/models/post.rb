class Post < ActiveRecord::Base
  def self.search(query)
		if query.present?
			rank = <<-RANK
        ts_rank(to_tsvector(title), plainto_tsquery(#{sanitize(query)})) +
        ts_rank(to_tsvector(content), plainto_tsquery(#{sanitize(query)}))
      RANK
      where("title @@ :q or content @@ :q", q: query).order("#{rank} desc")
    else
      all
    end
  end

  validates_presence_of :user_id
  validates :title, :content, presence: true
  validates_length_of :content, minimum: 1, maximum: 600
  validates_length_of :title, minimum: 1, maximum: 50
  scope :desc_order, -> { order("created_at DESC") }

  belongs_to :user
  has_many :comments
end
