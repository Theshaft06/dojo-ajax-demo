class TodosController < ApplicationController
  
  before_action :set_todos, only: [:index, :create, :destroy, :update]

  def index
  	@todo = Todo.new
  end

  def create
  	todo = Todo.create(todo_params)
  	respond_to do |format|
  	  format.js
  	end
  end

  def destroy
  	Todo.find(params[:id]).destroy
  	respond_to do |format|
  	  format.js
  	end
  end

  def update
    todo = Todo.find(params[:id])
    todo.update_attributes(todo_params)
    respond_to do |format|
      if todo.update_attributes(todo_params)
        format.html { redirect_to todos_path }
        format.json { head :ok }
      else
        format.html { render :action => "index" }
        format.json { render :json => todo.errors.full_messages, :status => :unprocessable_entity }
      end
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
