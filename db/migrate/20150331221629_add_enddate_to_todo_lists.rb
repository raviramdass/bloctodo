class AddEnddateToTodoLists < ActiveRecord::Migration
  def change
    add_column :todo_lists, :enddate, :date
  end
end
