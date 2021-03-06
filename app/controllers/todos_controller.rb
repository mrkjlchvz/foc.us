class TodosController < ApplicationController
  def new
    @todo = Todo.new
  end

  def create
    @todo = current_user.todos.build(todo_params)

    if @todo.save
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @todo = current_user.todos.find(params[:id])
  end

  def update
    @todo = current_user.todos.find(params[:id])

    if @todo.update_attributes(todo_params)
      redirect_to root_url
    else
      render :edit
    end
  end

  def destroy
    @todo = current_user.todos.find(params[:id])
    @todo.destroy

    redirect_to root_url
  end

  private

    def todo_params
      params.require(:todo).permit(:description, :action_items_attributes => [:id, :description, :_destroy])
    end
end
