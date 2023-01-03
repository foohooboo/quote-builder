require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:first)
  end

  test "Creating an new quote" do
    # When we visit the Quotes#index page
    # we expect to see a title with the text "Quotes"
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    # When we click on the "New Quote" link
    # we expect to land on a page with the title "New Quote"
    click_on "New Quote"
    assert_selector "h1", text: "New Quote"

    # When we fill in the form with "Capybara quote"
    # and click on the "Create Quote" button
    fill_in "Name", with: "Capybara quote"
    click_on "Create Quote"

    # We expect to be back on the Quotes#index page
    # and see our new quote
    assert_selector "h1", text: "Quotes"
    assert_text "Capybara quote"
  end

  test "Show a quote" do
    visit quotes_path
    click_link @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "Updating a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit Quote"

    fill_in "Name", with: "Updated quote"
    click_on "Update Quote"
  end

  test "Destroying a quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end
end
