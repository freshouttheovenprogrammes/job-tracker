class CategoriesController < ApplicationController
  before_action :set_category_params, only: [:show, :edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "You have saved the category #{@category.title}"
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def index
    @categories = Category.all
  end

  def destroy
    @category.destroy

    flash[:success] = "#{@category.title} was successfully deleted"
    redirect_to categories_path
  end

  def show
  end

  def edit
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def set_category_params
    @category = Category.find(params[:id])
  end
end
