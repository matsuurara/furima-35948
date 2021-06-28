class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]


  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
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
    ).merge(user_id: current_user.id, item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end