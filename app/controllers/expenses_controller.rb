class ExpensesController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @expense = Expense.new
  end

  def create
    @category = Category.find(params[:category_id])
    @expense = @category.expenses.create(expense_params)
    if @expense.save
      flash[:notice] = 'Transaction created successfully.'
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    authorize! :destroy, @expense
    flash[:notice] = if @expense.destroy
                       'Transaction removed successfully'
                     else
                       'Something went wrong'
                     end
    redirect_to root_path
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :author_id)
  end
end
