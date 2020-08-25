require 'test_helper'

class Admins::ContactsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @contact = contacts(:test_contact)
  end

  test "should redirect index when not login" do
    get admins_contacts_path
    assert_redirected_to new_user_session_path
  end

  test "should redirect show when not login" do
    get admins_contact_path(@contact)
    assert_redirected_to new_user_session_path
  end

  test "should redirect update when not login" do
    patch admins_contact_path(@contact)
    assert_redirected_to new_user_session_path
  end

end
