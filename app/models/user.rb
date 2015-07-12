class User < ActiveRecord::Base
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #-----------
  validates :username, presence: true, uniqueness: true

  #-----------
  enum role: [ :rookie, :pro, :admin ]
  after_initialize :set_default_role, :if => :new_record?

  #-----------
  has_many :posts

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
