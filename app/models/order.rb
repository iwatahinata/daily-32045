class Order < ApplicationRecord
  belongs_to :user
  belongs_to :food
  has_one :address
end
