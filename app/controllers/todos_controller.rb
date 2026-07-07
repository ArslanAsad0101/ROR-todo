class TodosController < ApplicationController






    @@todos = []

    def index
        @todos = @@todos
    end

    def new
    end

   def create

  todo = {
    title: params[:title],
    description: params[:description]
  }

  @@todos << todo


  flash[:notice] = "Todo created successfully"
  redirect_to "/todos"

end

    def show
  @todo = @@todos[params[:id].to_i]
end

def edit
  @todo = @@todos[params[:id].to_i]
end

def update
  @todo = @@todos[params[:id].to_i]

  @todo[:title] = params[:title]
  @todo[:description] = params[:description]

  flash[:notice] = "Todo updated successfully!"
  redirect_to "/todos"
end

def destroy

  @@todos.delete_at(params[:id].to_i)

  flash[:notice] = "Todo deleted successfully!"

  redirect_to "/todos"

end

end