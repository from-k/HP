require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get about" do
    get about_path
    assert_response :success
  end

  test "should get activity" do
    get activity_path
    assert_response :success
  end

  test "should get events" do
    get events_path
    assert_response :success
  end

end
