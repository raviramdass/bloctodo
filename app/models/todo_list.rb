class TodoList < ActiveRecord::Base
  def enddate
    (DateTime.now + 6.days)
  end
end