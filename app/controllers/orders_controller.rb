class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @ship_purchase = ShipPurchase.new
  end

  def create
    @ship_purchase = ShipPurchase.new(purchase_params)
    if @ship_purchase.valid? 
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:ship_purchase).permit(:shipping_area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end