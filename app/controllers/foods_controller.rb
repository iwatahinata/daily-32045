class FoodsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  before_action :set_food, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

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
  end

  def edit
  end

  def search
    @foods = Food.search(params[:keyword])
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
      redirect_to food_path
    else
      render :edit
    end
  end

  def destroy
    @food = Food.find(params[:id])
    if current_user.id = @food.user_id
      @food.destroy
      redirect_to root_path
    end
  end

  private
  def food_params
    params.require(:food).permit(:title, :image, :price).merge(user_id: current_user.id)
  end

  def set_food
    @food = Food.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
