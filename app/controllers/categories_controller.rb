class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1 or /categories/1.json
  def show
    @category = Category.find(params[:id])
    @expenses = Expense.includes(:categories_expenses).where(category_id: @category.id).order(created_at: :desc)
    @total_cost = @expenses.where(category_id: @category.id).sum(:amount)
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # POST /categories or /categories.json
  def create
    @category = current_user.categories.new(category_params)

    if @category.save
      redirect_to categories_url, flash: { success: 'Category was successfully created.' }
    else
      redirect_to new_category_url, flash: { danger: 'Category was not created.' }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
