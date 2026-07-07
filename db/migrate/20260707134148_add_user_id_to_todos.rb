class AddUserIdToTodos < ActiveRecord::Migration[8.1]
  def change
    add_reference :todos, :user, foreign_key: true, null: true
  end
end