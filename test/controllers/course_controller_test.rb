require "test_helper"

class CourseControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get course_index_url
    assert_response :success
  end

  test "should get create" do
    get course_create_url
    assert_response :success
  end
end
