require 'test_helper'

class ContactTest < ActiveSupport::TestCase

  def setup
    @contact = Contact.new(company: "from K", name: "テスト太郎",
                            email: "text@text.com", tel: "0503233432",
                            opportunity_to_know: 1,
                            opportunity_to_know_other: "アパー",
                            content: "こんにちは", status: 2)
  end

  test "should be valid" do
    assert @contact.valid?
  end

  test "item should be present" do
    @contact.company = "  "
    assert_not @contact.valid?
    @contact.name = "  "
    assert_not @contact.valid?
    @contact.email = "  "
    assert_not @contact.valid?
    @contact.opportunity_to_know = "  "
    assert_not @contact.valid?
    @contact.content = "  "
    assert_not @contact.valid?
  end

  test "item should not be too long" do
    @contact.company = "a" * 51
    assert_not @contact.valid?
    @contact.name = "a" * 51
    assert_not @contact.valid?
    @contact.email = "a" * 51 + "@text.com"
    assert_not @contact.valid?
    @contact.tel = "a" * 255
    assert_not @contact.valid?
    @contact.opportunity_to_know_other = "a" * 51
    assert_not @contact.valid?
    @contact.content = "a" * 1001
    assert_not @contact.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
      first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @contact.email = valid_address
      assert @contact.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
      foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @contact.email = invalid_address
      assert_not @contact.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @contact.email = mixed_case_email
    @contact.save
    assert_equal mixed_case_email.downcase, @contact.reload.email
  end
end
