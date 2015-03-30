class AddBooleanFieldToTodoList < ActiveRecord::Migration
  def up
    add_column :todo_lists, :complete, :boolean, default: true
  end
end
