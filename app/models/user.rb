class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50}
  validates :email, uniqueness: {case_sensitive: false}
  validates :password, presence:true, length: {minimum: 6}

  before_save { self.email = self.email.mb_chars.downcase }

  has_secure_password
end
