require "application_system_test_case"

class FieldHistoriesTest < ApplicationSystemTestCase
  setup do
    @field_history = field_histories(:one)
  end

  test "visiting the index" do
    visit field_histories_url
    assert_selector "h1", text: "Field Histories"
  end

  test "creating a Field history" do
    visit field_histories_url
    click_on "New Field History"

    fill_in "Description", with: @field_history.description
    fill_in "Fields title", with: @field_history.fields_title
    fill_in "Variation name", with: @field_history.variation_name
    fill_in "Verstion", with: @field_history.verstion
    click_on "Create Field history"

    assert_text "Field history was successfully created"
    click_on "Back"
  end

  test "updating a Field history" do
    visit field_histories_url
    click_on "Edit", match: :first

    fill_in "Description", with: @field_history.description
    fill_in "Fields title", with: @field_history.fields_title
    fill_in "Variation name", with: @field_history.variation_name
    fill_in "Verstion", with: @field_history.verstion
    click_on "Update Field history"

    assert_text "Field history was successfully updated"
    click_on "Back"
  end

  test "destroying a Field history" do
    visit field_histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Field history was successfully destroyed"
  end
end
