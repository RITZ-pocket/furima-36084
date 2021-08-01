class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @ship_purchase = ShipPurchase.new
  end

  def create
    @ship_purchase = ShipPurchase.new(ship_params)
    if @ship_purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def ship_params
    params.require(:ship_purchase).permit( :shipping_area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id:params[:id])
  end
  
end