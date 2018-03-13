class Order < ApplicationRecord
  belongs_to :creator, class_name: 'user'
  belongs_to :currency

  validates :price, presence: true

  enum state: [:pending, :done, :failure]
end
