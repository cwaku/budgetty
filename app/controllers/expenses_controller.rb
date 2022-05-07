class ExpensesController < ApplicationController
  # GET /expenses or /expenses.json

  def index
    @expenses = current_user.expenses.order(created_at: :desc).all
    @category = Category.includes(:categories_expenses).where(id: params[:id])
    @categories = Category.all
    @total_cost = []
    @expenses.each do |expense|
      total = 0
      expense.categories_expenses.each do |categories_expense|
        total += categories_expense.amount
      end
      @total_cost << total
    end
  end

  # GET /expenses/1 or /expenses/1.json
  def show
    @expense = Expense.find(params[:id])
    @category = Category.find(@expense.category_id)
    @total_cost = 0
    @category.categories_expenses.each do |categories_expense|
      @total_cost += categories_expense.expense.amount
    end
  end

  # GET /expenses/new
  def new
    @category = Category.find(params[:category_id])
    @expense = Expense.new
  end

  # POST /expenses or /expenses.json

  def create
    @category = Category.find(params[:category_id])
    @expense = current_user.expenses.new(expense_params)
    if @expense.save
      redirect_to category_path, flash: { success: 'Expense was successfully created.' }
    else
      render :new, flash: { danger: 'Expense was not created.' }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:amount, :user_id, :name)
  end
end
