class User < ApplicationRecord
  has_secure_password
  has_many :orders, foreign_key: 'creator_id'
  validates :email, uniqueness: true, email: true
  validates :phone, uniqueness: true

  class << self
    def sign_in payload={}
        user = User.find_by_phone payload[:phone]
        if user and user.authenticate? payload[:ticket_code]
            return user
        end
        raise AuthError.new messsage: 'phone_or_ticket_code_error', reason: 'auth_error'
    end
  end
end
