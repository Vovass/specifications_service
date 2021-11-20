require "application_system_test_case"

class VocabularyHistoriesTest < ApplicationSystemTestCase
  setup do
    @vocabulary_history = vocabulary_histories(:one)
  end

  test "visiting the index" do
    visit vocabulary_histories_url
    assert_selector "h1", text: "Vocabulary Histories"
  end

  test "creating a Vocabulary history" do
    visit vocabulary_histories_url
    click_on "New Vocabulary History"

    fill_in "Description", with: @vocabulary_history.description
    fill_in "Name", with: @vocabulary_history.name
    fill_in "Spec name", with: @vocabulary_history.spec_name
    click_on "Create Vocabulary history"

    assert_text "Vocabulary history was successfully created"
    click_on "Back"
  end

  test "updating a Vocabulary history" do
    visit vocabulary_histories_url
    click_on "Edit", match: :first

    fill_in "Description", with: @vocabulary_history.description
    fill_in "Name", with: @vocabulary_history.name
    fill_in "Spec name", with: @vocabulary_history.spec_name
    click_on "Update Vocabulary history"

    assert_text "Vocabulary history was successfully updated"
    click_on "Back"
  end

  test "destroying a Vocabulary history" do
    visit vocabulary_histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vocabulary history was successfully destroyed"
  end
end
