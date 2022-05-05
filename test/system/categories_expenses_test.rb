require "application_system_test_case"

class CategoriesExpensesTest < ApplicationSystemTestCase
  setup do
    @categories_expense = categories_expenses(:one)
  end

  test "visiting the index" do
    visit categories_expenses_url
    assert_selector "h1", text: "Categories expenses"
  end

  test "should create categories expense" do
    visit categories_expenses_url
    click_on "New categories expense"

    click_on "Create Categories expense"

    assert_text "Categories expense was successfully created"
    click_on "Back"
  end

  test "should update Categories expense" do
    visit categories_expense_url(@categories_expense)
    click_on "Edit this categories expense", match: :first

    click_on "Update Categories expense"

    assert_text "Categories expense was successfully updated"
    click_on "Back"
  end

  test "should destroy Categories expense" do
    visit categories_expense_url(@categories_expense)
    click_on "Destroy this categories expense", match: :first

    assert_text "Categories expense was successfully destroyed"
  end
end
