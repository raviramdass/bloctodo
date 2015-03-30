class TodoItemsController < ApplicationController
  before_action :find_todo_list
  
  def index
    @todo_list = TodoList.find(params[:todo_list_id])
  end
  
  def new
    #@todo_list = TodoList.find(params[:todo_list_id])
    @todo_item = @todo_list.todo_items.new
  end
  
  def create
    #@todo_list = TodoList.find(params[:todo_list_id])
    @todo_item = @todo_list_todo_items.new(todo_item_params)
      if todo_item.save
        flash[:success] = "Todo Item was added to Todo List."
        redirect_to todo_list_todo_items_path
      else
        flash[:error] = "There was an error creating Todo Item."
        redirect_to @todo_list
    end
  end
  
  def complete
    @todo_item = @todo_list.todo_items.find(params[:id])
    @todo_item.update_attribute(:completed_at, Time.now)
    redirect_to todo_list_todo_items_path, notice: "Todo item marked as complete."
  end
    
  def destroy
   @todo_item = @todo_list.todo_items.find(params[:id]) 
      if @todo_item.destroy
        flash[:success] = "Todo list was deleted."
      else
        flash[:error] = "Todo list could not be deleted."
      end
       redirect_to todo_list_todo_items_path
       #@todo_list = TodoList.find(params[:id])
       #if @todo_list.destroy      
       #redirect_to todo_lists_path, notice: "Item marked complete."
  end
    
  
  def edit
    @todo_item = @todo_list_todo_item.find(params[:id])
  end
  
  private
  
  def find_todo_list
    @todo_list = current_user.todo_list.find(params[:todo_list_id])
    #@todo_list = TodoList.find(params[:todo_list_id])
  end
    
    def todo_item_params
      params[:todo_item].permit(:content)
    end
end
