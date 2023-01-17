require "test_helper"

class ProjectAssignmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get project_assignments_index_url
    assert_response :success
  end

  test "should get show" do
    get project_assignments_show_url
    assert_response :success
  end

  test "should get new" do
    get project_assignments_new_url
    assert_response :success
  end
end
