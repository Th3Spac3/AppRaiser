require "test_helper"

class HelpControllerTest < ActionDispatch::IntegrationTest
  test "should get contacts" do
    get help_contacts_url
    assert_response :success
  end

  test "should get about" do
    get help_about_url
    assert_response :success
  end
end
