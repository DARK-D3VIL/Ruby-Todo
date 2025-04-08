class CreateTodoItems < ActiveRecord::Migration[6.1]
  def change
    create_table :todo_items do |t|
      t.string :title
      t.text :description
      t.boolean :completed, default: false
      t.datetime :due_date

      t.timestamps
    end
  end
end
