# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :authenticate_user

  def index
    @todos = @current_user.todos
    render json: @todos
  end

  def show
    render json: user_todo
  end

  def create
    user_todo = @current_user.todos.build(todo_params)
    if user_todo.save
      render json: user_todo, status: :created
    else
      render json: user_todo.errors, status: :unprocessable_entity
    end
  end

  def update
    if user_todo.update(todo_params)
      render json: user_todo
    else
      render json: todo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    user_todo.destroy
  end

  private

  def user_todo
    @todo = @current_user.todos.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:task)
  end
end
