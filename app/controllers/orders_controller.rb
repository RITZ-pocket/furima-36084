class OrdersController < ApplicationController

  def index
    @item_ship = Item.find(params[:item_id])
  end

  def create
    @ship = ItemShip.new(ship_params)
    if @ship.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def ship_params
    params.require(:item).permit(:name, :price, :introduction, :category_id, :item_condition_id, :postage_payer_id, :day_to_ship_id, :post_code, :shipping_area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id:params[:id])
  end
  
end
