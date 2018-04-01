class CategoriesController < ApplicationController

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


  private

  def category_params
    params.require(:category).permit(:title)
  end
end
