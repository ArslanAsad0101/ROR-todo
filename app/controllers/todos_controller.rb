class TodosController < ApplicationController
  before_action :require_login
  before_action :set_todo, only: %i[show edit update destroy]

  def index
    @todos = current_user.todos.order(created_at: :desc)
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = current_user.todos.build(todo_params)

    if @todo.save
      flash[:notice] = "Todo created successfully"
      redirect_to todos_path
    else
      flash.now[:alert] = @todo.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      flash[:notice] = "Todo updated successfully!"
      redirect_to todos_path
    else
      flash.now[:alert] = @todo.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @todo.destroy
    flash[:notice] = "Todo deleted successfully!"
    redirect_to todos_path
  end

  private

  def set_todo
    @todo = current_user.todos.find(params[:id])
  end

  def todo_params
    params.permit(:title, :description)
  end
end