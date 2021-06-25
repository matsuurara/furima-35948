class ItemsController < ApplicationController
  before_action :move_to_index, only: :new

  def index
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
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

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
