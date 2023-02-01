class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true

  before_save {self.email.downcase!}

  def self.authenticate_with_credentials(email, password)
    User.find_by_email(email.strip.downcase)&.authenticate(password)
  end

end
