require "test_helper"

class InspectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inspection = inspections(:one)
  end

  test "should get index" do
    get inspections_url, as: :json
    assert_response :success
  end

  test "should create inspection" do
    assert_difference('Inspection.count') do
      post inspections_url, params: { inspection: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show inspection" do
    get inspection_url(@inspection), as: :json
    assert_response :success
  end

  test "should update inspection" do
    patch inspection_url(@inspection), params: { inspection: {  } }, as: :json
    assert_response 200
  end

  test "should destroy inspection" do
    assert_difference('Inspection.count', -1) do
      delete inspection_url(@inspection), as: :json
    end

    assert_response 204
  end
end
