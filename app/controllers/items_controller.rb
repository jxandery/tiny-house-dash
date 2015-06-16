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

  def destroy
    Item.find(params[:id]).delete
    redirect_to :index
  end
end
