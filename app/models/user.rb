class User < ApplicationRecord
  has_secure_password
  has_many :orders, foreign_key: 'creator_id'
  validates :email, uniqueness: true, email: true
  validates :phone, uniqueness: true

  class << self
    def sign_in payload={}
        user = User.find_by_email payload[:email]
        if user and user.authenticate? payload[:password]
            return user
        end
        raise AuthError.new messsage: 'email_or_password_error', reason: 'auth_error'
    end

    def sign_up payload={}
        user = User.find_by_email payload[:email]
        if user and user.authenticate? payload[:password]
            return user
        end
        raise AuthError.new message: 'email_or_password_error', reason: 'auth_error'
    end
  end

  def logout
      touch :logout_at
  end
end
