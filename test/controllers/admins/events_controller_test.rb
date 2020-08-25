require 'test_helper'

class Admins::EventsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @event = events(:test_event)
  end
  
  test "should redirect index when not login" do
    get admins_events_path
    assert_redirected_to new_user_session_path
  end

  test "should redirect show when not login" do
    get admins_event_path(@event)
    assert_redirected_to new_user_session_path
  end

  test "should redirect new when not login" do
    get new_admins_event_path
    assert_redirected_to new_user_session_path
  end

  # test "should redirect create when not login" do
  #   post admins_events_path(@event)
  #   # assert_redirected_to new_user_session_path
  # end

  test "should redirect edit when not login" do
    get edit_admins_event_path(@event)
    assert_redirected_to new_user_session_path
  end

  test "should redirect update when not login" do
    patch admins_event_path(@event)
    assert_redirected_to new_user_session_path
  end

  test "should redirect delete when not login" do
    delete admins_event_path(@event)
    assert_redirected_to new_user_session_path
  end
end
