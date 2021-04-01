class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with(
    name: ENV['ADMIN_USERNAME'],
    password: ENV['ADMIN_PASSWORD']
  )
  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @product = Category.new(category_params)

    if @product.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
    )
  end


end
