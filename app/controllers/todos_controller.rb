class TodosController < ApplicationController
  
  before_action :set_todos, only: [:index, :create, :destroy]

  def index
  	@todo = Todo.new
  end

  def create
  	todo = Todo.create(todo_params)
  	respond_to do |anything|
  	  anything.js
  	end
  end

  def destroy
  	Todo.find(params[:id]).destroy
  	respond_to do |derp|
  	  derp.js
  	end
  end

  private
  def todo_params
  	params.require(:todo).permit(:item)
  end

  def set_todos
  	@todos = Todo.all.where(completed: false)
  end

end
