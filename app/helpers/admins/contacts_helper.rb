module Admins::ContactsHelper

  # お問い合わせの対応状況を変換する
  def contact_status(status_number)
    case status_number
    when 1
      "未対応"
    when 2
      "対応中"
    when 3
      "対応済み"
    end
  end

  # from Kを知ったきっかけを変換する
  def contact_opportunity_to_know(opportunity_to_know_number)
    case opportunity_to_know_number
    when 1
      "ホームページ"
    when 2
      "Twitter"
    when 3
      "お知り合いから"
    when 4
      "その他"
    end
  end
end
