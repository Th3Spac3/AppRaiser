require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get contacts_about_url
    assert_response :success
  end

  test "should get help" do
    get contacts_help_url
    assert_response :success
  end

  test "should get index" do
    get contacts_index_url
    assert_response :success
  end
end
