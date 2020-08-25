require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @event = Event.new(title: "テストイベント", content: "とても楽しいイベントですヨヨヨよ",
                       event_image: "test.png", holded_at: Time.zone.now,
                       tag: 1)
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "title should be present" do
    @event.title = "   "
    assert_not @event.valid?
  end

  test "content should be present" do
    @event.content = "   "
    assert_not @event.valid?
  end

  test "tag should be present" do
    @event.tag = "   "
    assert_not @event.valid?
  end

  test "holded_at should be present" do
    @event.holded_at = "   "
    assert_not @event.valid?
  end

  test "title should not be too long" do
    @event.title = "a" * 51
    assert_not @event.valid?
  end

  test "content should not be too long" do
    @event.content = "a" * 2001
    assert_not @event.valid?
  end
end
