class OrdersController < ApplicationController
  before_action :user_logout, only: :index
  before_action :set_item
  before_action :move_to_index, only: :index

  def index
    @ship_purchase = ShipPurchase.new
  end

  def create
    @ship_purchase = ShipPurchase.new(purchase_params)
    if @ship_purchase.valid?
      pay_item
      @ship_purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:ship_purchase).permit(:shipping_area_id, :post_code, :city, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: set_item[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def user_logout
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user.id || @item.purchase.present?
  end
end
