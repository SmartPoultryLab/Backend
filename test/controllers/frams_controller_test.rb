require "test_helper"

class FramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fram = frams(:one)
  end

  test "should get index" do
    get frams_url, as: :json
    assert_response :success
  end

  test "should create fram" do
    assert_difference('Fram.count') do
      post frams_url, params: { fram: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show fram" do
    get fram_url(@fram), as: :json
    assert_response :success
  end

  test "should update fram" do
    patch fram_url(@fram), params: { fram: {  } }, as: :json
    assert_response 200
  end

  test "should destroy fram" do
    assert_difference('Fram.count', -1) do
      delete fram_url(@fram), as: :json
    end

    assert_response 204
  end
end
