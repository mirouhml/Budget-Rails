class CategoriesController < ApplicationController
  load_and_authorize_resource
  def index
    @user = current_user
    @categories = current_user.categories
  end

  def show; end

  def new
    @category = Category.new
  end
end
