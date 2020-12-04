class LineItemsController < ApplicationController
  def create
    cart = current_cart
    food = Food.find(params[:food_id])
    @line_item = cart.add_food(food.id)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item, notice: 'Line item was successfully created.' }
        format.ison { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.ison { render json: @line_item.errors, status: :unprocessable_entity }
      end
  end
end
