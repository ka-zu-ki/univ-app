class Api::V1::TodosController < ApplicationController
  def index
    todos = Todo.where(user_id: params[:user_id], myclass_id: params[:myclass_id])
    
    render json: todos
  end
  
  def create
    todo = Todo.new(todo_params)

    if todo.save
      render json: todo
    else
      render json:  todo.errors, status: 500
    end
  end

  def update
    todo = Todo.find(params[:id])
    if todo.update(todo_params)
      render json: todo
    else
      render json:  todo.errors, status: 500
    end
  end
  
  
  private
  def todo_params
    params.require(:todo).permit(:name, :is_completed)
          .merge(myclass_id: params[:myclass_id], user_id: params[:user_id])
  end
  
end
