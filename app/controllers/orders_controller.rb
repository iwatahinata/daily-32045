class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_food, only: [:index, :create]
  before_action :move_to_index, only: :index

  def index
    @address_order = AddressOrder.new
  end

  def create
    @address_order = AddressOrder.new(order_params)
    if @address_order.valid?
      pay_food
      @address_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end


  private

  def order_params
      params.require(:address_order).permit(:postal_code, :city, :street, :house_name, :phone_number).merge(user_id: current_user.id, food_id: params[:food_id], token: params[:token])
  end

  def pay_food
    Payjp.api_key = Rails.application.credentials.PAYJP[:PAYJP_SECRET_KEY]
      Payjp::Charge.create(
        amount: @food.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def move_to_index
    if user_signed_in? && current_user.id == @food.user_id
      redirect_to root_path
    end
  end

    def set_food
      @food = Food.find(params[:food_id])
    end
end
