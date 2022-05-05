require "test_helper"

class CategoriesExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categories_expense = categories_expenses(:one)
  end

  test "should get index" do
    get categories_expenses_url
    assert_response :success
  end

  test "should get new" do
    get new_categories_expense_url
    assert_response :success
  end

  test "should create categories_expense" do
    assert_difference("CategoriesExpense.count") do
      post categories_expenses_url, params: { categories_expense: {  } }
    end

    assert_redirected_to categories_expense_url(CategoriesExpense.last)
  end

  test "should show categories_expense" do
    get categories_expense_url(@categories_expense)
    assert_response :success
  end

  test "should get edit" do
    get edit_categories_expense_url(@categories_expense)
    assert_response :success
  end

  test "should update categories_expense" do
    patch categories_expense_url(@categories_expense), params: { categories_expense: {  } }
    assert_redirected_to categories_expense_url(@categories_expense)
  end

  test "should destroy categories_expense" do
    assert_difference("CategoriesExpense.count", -1) do
      delete categories_expense_url(@categories_expense)
    end

    assert_redirected_to categories_expenses_url
  end
end
