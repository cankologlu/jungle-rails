class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true
  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates :password, length: {minimum: 5, maximum: 15}

  def self.authenticate_with_credentials(email, password)
    stripped = email.strip.downcase
    user = User.find_by(email: stripped)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end


