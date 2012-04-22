class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  attr_reader :password

  validates_presence_of :name
  validates_format_of :email, :with => /@/
  validates_presence_of :password, :if => :require_password?
  validates_confirmation_of :password, :if => :require_password?
  validates_uniqueness_of :email

  has_many :questions
  has_many :comments

  scope :recent, order("id desc").limit(10)

  # def self.recent
  #   order("id desc").limit(10)
  # end

  def password=(password)
    salt, hash = PasswordEncryptor.encrypt(password)
    self.password_salt = salt
    self.password_hash = hash
    @password = password
  end

  private
  def require_password?
    new_record? || password.present? || password_confirmation.present?
  end
end
