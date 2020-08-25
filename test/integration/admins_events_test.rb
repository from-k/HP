require 'test_helper'

class AdminsEventsTestTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:fromk)
    @event = events(:test_event)
  end

  test "admins event layouts" do
    sign_in(@user)
    get admins_events_path
    assert_template "admins/events/index"
    assert_select "li", @event.title
    get new_admins_event_path
    assert_template "admins/events/new"
    assert_select "form.events_form"
  end

  test "create event with invalid information" do
    sign_in(@user)
    get new_admins_event_path
    assert_no_difference "Event.count" do
      post admins_events_path, params: {event: {title: "", content: "",
                                                event_image: "", holded_at: nil,
                                                tag: nil}}
    end
  end

  test "create event with valid information" do
    sign_in(@user)
    get new_admins_event_path
    assert_difference "Event.count", 1 do
      post admins_events_path, params: {event: {title: "テストイベント",
                                                content: "とても楽しいです",
                                                event_image: "image.png",
                                                holded_at: Date.today,
                                                tag: 1}}
    end
    assert_not flash.empty?
    assert_redirected_to admins_events_path
  end
end
