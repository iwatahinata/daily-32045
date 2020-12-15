class Food < ApplicationRecord
  has_one_attached :image
  has_one          :order
  belongs_to       :user, optional: true
  has_many         :favorites, dependent: :destroy
  

  with_options presence: true do
  validates :image
  validates :title
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 10000 }
  end
  
  def self.search(search)
    if search != ""
      Food.where('title LIKE(?)', "%#{search}%")
    else
      Food.all
    end
  end
end
