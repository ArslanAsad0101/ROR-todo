require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should get create" do
    assert_difference("User.count", 1) do
      post signup_path, params: { user: { name: "Test User", email: "test@example.com" } }
    end

    assert_redirected_to todos_path
  end
end
