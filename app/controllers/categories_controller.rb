class CategoriesController < ApplicationController
  load_and_authorize_resource
  def index
    @user = current_user
    @categories = current_user.categories.includes(:author)
  end

  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.author_id = current_user.id
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
