class CategoriesController < ApplicationController
  before_filter :authorize, only: [:edit, :update]

  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.create(category_params)
    redirect_to user_story_path(@category.user_story)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.update(params[:id], category_params)
    redirect_to category_path(id: params[:id])
  end

  def destroy
    Category.destroy(params[:id])
  end

private

  def category_params
    params.require(:category).permit(:name, :user_story_id)
  end
end
