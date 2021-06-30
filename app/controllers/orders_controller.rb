class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]


  def index
    @item = Item.find(params[:id])
    @order_address = OrderAddress.new
    if @item.user_id == current_user.id || @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    @item = Item.find(params[:id])
    params.require(:order_address).permit(
      :postal_code,
      :region_id,
      :city,
      :house_number,
      :floor,
      :telephone_number,
    ).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end