require "test_helper"

class VocabularyHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vocabulary_history = vocabulary_histories(:one)
  end

  test "should get index" do
    get vocabulary_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_vocabulary_history_url
    assert_response :success
  end

  test "should create vocabulary_history" do
    assert_difference('VocabularyHistory.count') do
      post vocabulary_histories_url, params: { vocabulary_history: { description: @vocabulary_history.description, name: @vocabulary_history.name, spec_name: @vocabulary_history.spec_name } }
    end

    assert_redirected_to vocabulary_history_url(VocabularyHistory.last)
  end

  test "should show vocabulary_history" do
    get vocabulary_history_url(@vocabulary_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_vocabulary_history_url(@vocabulary_history)
    assert_response :success
  end

  test "should update vocabulary_history" do
    patch vocabulary_history_url(@vocabulary_history), params: { vocabulary_history: { description: @vocabulary_history.description, name: @vocabulary_history.name, spec_name: @vocabulary_history.spec_name } }
    assert_redirected_to vocabulary_history_url(@vocabulary_history)
  end

  test "should destroy vocabulary_history" do
    assert_difference('VocabularyHistory.count', -1) do
      delete vocabulary_history_url(@vocabulary_history)
    end

    assert_redirected_to vocabulary_histories_url
  end
end
