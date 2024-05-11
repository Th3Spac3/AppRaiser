require "test_helper"

class AboutControllerTest < ActionDispatch::IntegrationTest
  test "should get help" do
    get about_help_url
    assert_response :success
  end

  test "should get index" do
    get about_index_url
    assert_response :success
  end

  test "should get contacts" do
    get about_contacts_url
    assert_response :success
  end
end
