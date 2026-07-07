require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_path
    assert_response :success
  end

  test "should get create" do
    user = User.create!(name: "Test User", email: "test@example.com")
    post login_path, params: { email: user.email }

    assert_redirected_to todos_path
  end

  test "should get destroy" do
    delete logout_path
    assert_redirected_to login_path
  end
end
