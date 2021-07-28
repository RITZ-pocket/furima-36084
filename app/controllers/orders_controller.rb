class OrdersController < ApplicationController

  def index
    @items = Item.find(params[:item_id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :introduction, :category_id, :day_to_ship_id, :item_condition_id,
                                 :postage_payer_id, :shipping_area_id, :image).merge(user_id: current_user.id)
  end
  
end
