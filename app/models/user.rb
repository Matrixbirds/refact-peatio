class User < ApplicationRecord
  has_secure_password
  has_many :orders, foreign_key: 'creator_id'
  validates :email, uniqueness: true, email: true
  validates :phone, uniqueness: true
end
