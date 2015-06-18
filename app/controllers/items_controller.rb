class ItemsController < ApplicationController
  before_action :authorize, only: [:edit, :update]

  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.create(item_params)
    redirect_to category_path(@item.category)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.update(params[:id], item_params)
    redirect_to item_path(id: params[:id])
  end

  def destroy
    Item.find(params[:id]).delete
    redirect_to :index
  end

private

  def item_params
    params.require(:item).permit(:name, :category_id)
  end

  def authorize
    if current_user && !current_user.admin?
      redirect_to login_url, alert: "Not authorized"
    end
  end
end
