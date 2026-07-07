require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  test "creates a todo and stores it in the database" do
    assert_difference("Todo.count", 1) do
      post todos_path, params: { title: "Buy milk", description: "From the grocery store" }
    end

    assert_redirected_to todos_path
    assert_equal "Buy milk", Todo.last.title
    assert_equal "From the grocery store", Todo.last.description
  end
end
