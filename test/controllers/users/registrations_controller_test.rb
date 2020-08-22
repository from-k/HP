require 'test_helper'

class Users::RegistrationsControllerTest < ActionDispatch::IntegrationTest

    test "should redirect to root path when User.count >= 1" do
      assert_equal 1, User.count
      get new_user_registration_path
      assert_redirected_to root_path
    end

    test "should get new when User.count == 0" do
      User.first.destroy
      get new_user_registration_path
      assert_redirected_to new_user_registration_path
    end
end
