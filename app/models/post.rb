class Post < ActiveRecord::Base
#--- Search
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

#---- Tagging
  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect {|tag|tag.strip.capitalize}.uniq
    new_or_found_tags = tag_names.collect {|name| Tag.find_or_create_by(name: name)}
    self.tags = new_or_found_tags
  end

#---- Validations
  validates_presence_of :user_id
  validates :title, :content, presence: true
  validates :userShot, presence:true
  validates_length_of :title, minimum: 1, maximum: 50
  validates_length_of :content, minimum: 1, maximum: 600

#---- Scopes
  scope :desc_order, -> { order("created_at ASC") }
  scope :only_three, -> { limit(5) }

#---- Associations
  belongs_to :user
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

#---- Screenshot feature
  has_attached_file :userShot, :styles => {:large => "900x550>"}, :default_url => "/images/userShot/default_image.jpg"
  validates_attachment_content_type :userShot, :content_type => /\Aimage\/.*\Z/
end
