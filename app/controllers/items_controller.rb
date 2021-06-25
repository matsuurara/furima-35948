class ItemsController < ApplicationController

  def index

  end

  def show

  end

  def new
    @item = Item.new
  end


  private
  def items_params
    params.require(:item).permit(
      :name,
      :info,
      :price,
      :status_id,
      :delivery_charger_id,
      :delivery_date_id,
      :category_id,
      :region_id,
      :image
    ).merge(user_id: current_user.id)
  end

end
