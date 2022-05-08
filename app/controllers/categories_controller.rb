class CategoriesController < ApplicationController
  def index
    @categories = Category.where(author_id: current_user.id)
  end

  def show
    @category = Category.find(params[:id])
    @category_expenses = @category.expenses.all
  end

  def new
    @category = Category.new
    @icons = icons
  end

  def create
    @category = current_user.categories.create(category_params)
    if @category.save
      flash[:notice] = 'Category created successfully.'
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    authorize! :destroy, @category
    flash[:notice] = if @category.destroy
                       'Category removed successfully'
                     else
                       'Something went wrong'
                     end
    redirect_to root_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end

  def icons
    { 'Grocery' => 'icon0.png', 'Shopping' => 'icon1.png', 'Education' => 'icon2.png', 'Bills' => 'icon3.png',
      'Insurance' => 'icon4.png', 'Travel' => 'icon5.png' }
  end
end
