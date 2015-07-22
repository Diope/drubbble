class User < ActiveRecord::Base
  after_initialize :set_default_role, :if => :new_record?
  after_create :create_profile

  attr_accessor :login, :tagline, :location, :website, :available
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #-----------
  validates :username, presence: true, uniqueness: true

  #-----------
  enum role: [ :rookie, :admin ]

  #-----------
  has_many :posts
  has_many :comments, dependent: :destroy
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile, allow_destroy: true

  #-----------

  def set_default_role
    self.role ||= :rookie
  end

  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions.to_h).first
      end
    end
end
