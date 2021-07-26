class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Iten.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :introduction, :category_id, :day_to_ship_id, :item_condition_id,
                                 :postage_payer_id, :shipping_area_id, :image).merge(user_id: current_user.id)
  end
end
