require 'test_helper'

class ContactFormTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
  end
  
  test "invalid contact information" do
    get contact_path
    assert_no_difference "Contact.count" do
      post contact_path, params: {contact: {company: "", name: "",
                            email: "", tel: "", opportunity_to_know: 20,
                            opportunity_to_know_other: "", content: ""}}
    end
    assert_template "contacts/new"
    assert_select "div#error_explanation"
  end

  test "valid contact information" do
    get contact_path
    assert_difference "Contact.count", 1 do
      post contact_path, params: {contact: {company: "from K", name: "テスト",
                            email: "test@test.com", tel: "032-3434-43434",
                            opportunity_to_know: 2,
                            opportunity_to_know_other: "ピカソ",
                            content: "お問い合わせしてみました"}}
    end
    @contact = assigns(:contact)
    assert_equal 0, @contact.status
    assert_template "contacts/new"
    assert_not flash.empty?
  end


end
