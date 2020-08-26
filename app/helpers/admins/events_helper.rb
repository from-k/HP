module Admins::EventsHelper

  # イベントのタグを変換する
  def event_tag(tag_number)
    case tag_number
    when 1
      "イベント"
    when 2
      "お知らせ"
    end
  end
end
