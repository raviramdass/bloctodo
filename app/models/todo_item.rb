class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  
  def days_left
    (DateTime.now.to_date - created_at.to_date).to_i
  end
  
end
