class FoodsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  def index
    @foods = Food.all.order("id DESC")
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @food = Food.find(params[:id])
  end

  private
  def food_params
    params.require(:food).permit(:title, :image, :price).merge(user_id: current_user.id)
  end
end
