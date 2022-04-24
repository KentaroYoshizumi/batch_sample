class CategoriesController < ApplicationController
  def index
    categories = Category.all
    render json: categories, each_serializer: CategorySerializer, include: [:ideas]
  end

  def create
    category = Category.new(category_params)
    if catgory.save
      render json: { status: 'SUCCESS', data: category }
    else
      render json: { status: 'ERROR', data: category.errors }
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
