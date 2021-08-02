class OrdersController < ApplicationController
  before_action :set_item

  def index
    @ship_purchase = ShipPurchase.new
  end

  def create
    @ship_purchase = ShipPurchase.new(purchase_params)
    if @ship_purchase.valid? 
      @ship_purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:ship_purchase).permit(:shipping_area_id, :post_code, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def  set_item
    @item = Item.find(params[:item_id])
  end
end