class AddPriorityToTodoItems < ActiveRecord::Migration[6.1]
  def change
    add_column :todo_items, :priority, :string
  end
end
