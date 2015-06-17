class ItemsController < ApplicationController
  before_filter :authorize, only: [:edit, :update]

  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find_by(params[:id])
  end

  def create
    @item = Item.create(item_params)
    redirect_to category_path(@item.category)
  end

  def destroy
    Item.find(params[:id]).delete
    redirect_to :index
  end

private

  def item_params
    params.require(:item).permit(:name, :category_id)
  end
end
