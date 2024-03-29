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
      render json: todo.errors, status: :internal_server_error
    end
  end

  def update
    todo = Todo.find(params[:id])
    if todo.update(name: todo_params[:name], is_completed: todo_params[:is_completed])
      render json: todo
    else
      render json: todo.errors, status: :internal_server_error
    end
  end

  def destroy
    if Todo.destroy(params[:id])
      head :no_content
    else
      render json: { error: 'Failed to destroy' }, status: :unprocessable_entity
    end
  end

  def destroy_all
    todos = Todo.where(user_id: params[:user_id], myclass_id: params[:myclass_id])

    if todos.destroy_all
      head :no_content
    else
      render json: { error: 'Failed to destroy' }, status: :unprocessable_entity
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :is_completed)
          .merge(myclass_id: params[:myclass_id], user_id: params[:user_id])
  end
end
