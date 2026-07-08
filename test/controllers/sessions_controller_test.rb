require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_path
    assert_response :success
  end

  test "should authenticate a user with the correct password" do
    user = User.create!(name: "Test User", email: "test@example.com", password: "password123", password_confirmation: "password123")
    post login_path, params: { email: user.email, password: "password123" }

    assert_redirected_to todos_path
  end

  test "should reject invalid credentials" do
    user = User.create!(name: "Test User", email: "test@example.com", password: "password123", password_confirmation: "password123")
    post login_path, params: { email: user.email, password: "wrongpass" }

    assert_response :unprocessable_entity
    assert_select "div#error-messages"
  end

  test "should get destroy" do
    delete logout_path
    assert_redirected_to login_path
  end
end
