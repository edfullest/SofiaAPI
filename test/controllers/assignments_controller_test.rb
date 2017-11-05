require 'test_helper'

class AssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assignment = assignments(:one)
  end

  test "should get index" do
    get assignments_url, as: :json
    assert_response :success
  end

  test "should create assignment" do
    assert_difference('Assignment.count') do
      post assignments_url, params: { assignment: { course_id: @assignment.course_id, end_date: @assignment.end_date, name: @assignment.name, rating: @assignment.rating, start_date: @assignment.start_date, type: @assignment.type } }, as: :json
    end

    assert_response 201
  end

  test "should show assignment" do
    get assignment_url(@assignment), as: :json
    assert_response :success
  end

  test "should update assignment" do
    patch assignment_url(@assignment), params: { assignment: { course_id: @assignment.course_id, end_date: @assignment.end_date, name: @assignment.name, rating: @assignment.rating, start_date: @assignment.start_date, type: @assignment.type } }, as: :json
    assert_response 200
  end

  test "should destroy assignment" do
    assert_difference('Assignment.count', -1) do
      delete assignment_url(@assignment), as: :json
    end

    assert_response 204
  end
end
