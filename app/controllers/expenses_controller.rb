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
    # redirect_to new_expense_p
    @expense = Expense.new
    @category = Category.all
    # reload the page
    # render :new
    respond_to do |format|
      format.html { render :new }
    end
  end

  # POST /expenses or /expenses.json

  def create
    @expense = current_user.expenses.new(expense_params)
    @category = Category.all
    if @expense.save
      CategoriesExpense.create(category_id: @expense.category_id, expense_id: @expense.id)
      redirect_to expense_url(@expense), flash: { success: 'Expense was successfully created.' }
    else
      redirect_to new_category_expense_url, flash: { danger: 'Expense was not created.' }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:amount, :category_id, :name)
  end
end
