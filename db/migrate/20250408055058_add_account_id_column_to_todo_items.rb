class AddAccountIdColumnToTodoItems < ActiveRecord::Migration[6.1]
  def change
    add_column :todo_items, :user_id, :bigint
  end
end
