require 'test_helper'

class AdminsContactTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:fromk)
    @contact = contacts(:test_contact)
  end

  test "admins contact layouts" do
    sign_in(@user)
    get admins_contacts_path
    assert_template "admins/contacts/index"
    assert_select "li"
    get admins_contact_path(@contact)
    assert_template "admins/contacts/show"
    assert_select "ul.contact_info"
    # 対応状況の更新
    patch admins_contact_path(@contact), params: {contact: {status: 2}},
                 headers: { "HTTP_REFERER" => admins_contact_path(@contact) },
                 xhr: true
    assert_not flash.empty?
    # assert_template "admins/contacts/show"
    @contact.reload
    assert_equal 2, @contact.status
  end
end
