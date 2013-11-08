class ItemsController < ApplicationController
  # include CurrentOrder
  def index
    @current_order
    @main_categories = Category.where(type_of: 'main_menu')
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_attributes)
    item.save
    redirect_to items_path
  end


  def item_attributes
    params.require(:item)
          .permit(:title, :description, :price)
  end


end
