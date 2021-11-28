require "test_helper"

class FieldHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @field_history = field_histories(:one)
  end

  test "should get index" do
    get field_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_field_history_url
    assert_response :success
  end

  test "should create field_history" do
    assert_difference('FieldHistory.count') do
      post field_histories_url, params: { field_history: { description: @field_history.description, fields_title: @field_history.fields_title, variation_name: @field_history.variation_name, verstion: @field_history.verstion } }
    end

    assert_redirected_to field_history_url(FieldHistory.last)
  end

  test "should show field_history" do
    get field_history_url(@field_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_field_history_url(@field_history)
    assert_response :success
  end

  test "should update field_history" do
    patch field_history_url(@field_history), params: { field_history: { description: @field_history.description, fields_title: @field_history.fields_title, variation_name: @field_history.variation_name, verstion: @field_history.verstion } }
    assert_redirected_to field_history_url(@field_history)
  end

  test "should destroy field_history" do
    assert_difference('FieldHistory.count', -1) do
      delete field_history_url(@field_history)
    end

    assert_redirected_to field_histories_url
  end
end
