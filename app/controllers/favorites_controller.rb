class FavoritesController < ApplicationController
  before_action :set_food
  before_action :authenticate_user!

  def create
      @favorite = Favorite.create(user_id: current_user.id, food_id: params[:food_id])
      @favorite.save
      

  end
  
  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, food_id: params[:food_id])
    @favorite.destroy
    
  end



  private
  def set_food
    @food = Food.find(params[:food_id])
  end

end
