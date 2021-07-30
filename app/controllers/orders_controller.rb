class OrdersController < ApplicationController

  def index
    @items = Item.find(params[:item_id])
  end

  def create
    @order = Ship.new(order_params)
    if @order.valid?
      @order.save
      retrun redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:ship).permit(:post_code, :shipping_area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id)
  end
  
end
