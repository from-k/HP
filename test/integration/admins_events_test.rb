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
    assert_template "admins/events/new"
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

  test "update event with invalid information" do
    sign_in(@user)
    get edit_admins_event_path(@event)
    patch admins_event_path, params: {event: {title: "", content: "",
                                              event_image: "", holded_at: nil,
                                              tag: nil}}
    assert_template "admins/events/edit"
  end

  test "update event with valid information" do
    sign_in(@user)
    get edit_admins_event_path(@event)
    title = "変更祭り"
    content = "変更しました"
    holded_at = Date.today
    tag = 2
    patch admins_event_path, params: {event: {title: title,
                                              content: content,
                                              holded_at: holded_at,
                                              tag: tag}}
    assert_redirected_to admins_events_path
    assert_equal title, @event.reload.title
    assert_equal content, @event.reload.content
    # assert_equal event_image, @event.reload.event_image
    assert_equal holded_at, @event.reload.holded_at
    assert_equal tag, @event.reload.tag
  end
end
