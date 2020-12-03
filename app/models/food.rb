class Food < ApplicationRecord
  belongs_to       :user
  has_one_attached :image
  has_many         :orders
  has_many         :line_items, dependent: :destroy

  with_options presence: true do
  validates :image
  validates :title
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 10000 }
  end
  

end
