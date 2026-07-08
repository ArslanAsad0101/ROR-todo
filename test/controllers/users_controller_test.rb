require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should create account with secure password" do
    assert_difference("User.count", 1) do
      post signup_path, params: { user: { name: "Test User", email: "test@example.com", password: "password123", password_confirmation: "password123" } }
    end

    assert_redirected_to todos_path
  end

  test "should render errors when signup data is invalid" do
    assert_no_difference("User.count") do
      post signup_path, params: { user: { name: "", email: "invalid", password: "123", password_confirmation: "456" } }
    end

    assert_response :unprocessable_entity
    assert_select "div#error-messages"
  end
end
