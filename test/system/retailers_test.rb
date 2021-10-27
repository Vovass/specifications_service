require "application_system_test_case"

class RetailersTest < ApplicationSystemTestCase
  setup do
    @retailer = retailers(:one)
  end

  test "visiting the index" do
    visit retailers_url
    assert_selector "h1", text: "Retailers"
  end

  test "creating a Retailer" do
    visit retailers_url
    click_on "New Retailer"

    fill_in "Title", with: @retailer.title
    click_on "Create Retailer"

    assert_text "Retailer was successfully created"
    click_on "Back"
  end

  test "updating a Retailer" do
    visit retailers_url
    click_on "Edit", match: :first

    fill_in "Title", with: @retailer.title
    click_on "Update Retailer"

    assert_text "Retailer was successfully updated"
    click_on "Back"
  end

  test "destroying a Retailer" do
    visit retailers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Retailer was successfully destroyed"
  end
end
