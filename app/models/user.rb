# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true
  after_initialize :ensure_session_token

  def self.generate_session_token
  end

  def find_by_credentials(email, password)
    user = User.find_by(email: email)
    user.password_is?(password) ? user : nil
  end

  def self.is_password?

  end

  def password=(password)
    self.password_digest = BCrypt::Password.new(password)
  end

  def reset_session_token!

  end

  private

  def ensure_session_token

  end
end
