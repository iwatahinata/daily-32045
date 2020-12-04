class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :foods, through: :line_items


def add_food(food_id)
  line_items.find_or_initialize_by(food_id: food_id)
end

def total_price
  line_items.to_a.sum { |item| item.total_price }
end

def total_number
  line_items.to_a.sum { |item| item.quantity }
end
end
