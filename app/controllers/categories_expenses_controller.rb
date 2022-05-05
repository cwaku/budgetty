class CategoriesExpensesController < ApplicationController
  before_action :set_categories_expense, only: %i[ show edit update destroy ]

  # GET /categories_expenses or /categories_expenses.json
  def index
    @categories_expenses = CategoriesExpense.all
  end

  # GET /categories_expenses/1 or /categories_expenses/1.json
  def show
  end

  # GET /categories_expenses/new
  def new
    @categories_expense = CategoriesExpense.new
  end

  # GET /categories_expenses/1/edit
  def edit
  end

  # POST /categories_expenses or /categories_expenses.json
  def create
    @categories_expense = CategoriesExpense.new(categories_expense_params)

    respond_to do |format|
      if @categories_expense.save
        format.html { redirect_to categories_expense_url(@categories_expense), notice: "Categories expense was successfully created." }
        format.json { render :show, status: :created, location: @categories_expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @categories_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories_expenses/1 or /categories_expenses/1.json
  def update
    respond_to do |format|
      if @categories_expense.update(categories_expense_params)
        format.html { redirect_to categories_expense_url(@categories_expense), notice: "Categories expense was successfully updated." }
        format.json { render :show, status: :ok, location: @categories_expense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @categories_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories_expenses/1 or /categories_expenses/1.json
  def destroy
    @categories_expense.destroy

    respond_to do |format|
      format.html { redirect_to categories_expenses_url, notice: "Categories expense was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categories_expense
      @categories_expense = CategoriesExpense.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def categories_expense_params
      params.fetch(:categories_expense, {})
    end
end
