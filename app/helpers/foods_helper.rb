module FoodsHelper
  def current_cart?(food, cart)
    cart.line_items.map{|i|i.food_id}.include?(food.id)
  end
end
