class Food < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
  validates :image
  validates :title
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 10000 }
  end
  

end
