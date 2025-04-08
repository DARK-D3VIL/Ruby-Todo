ActiveAdmin.register TodoItem do
  actions :index, :show

  # Optional: Customize what fields are shown on index and show
  index do
    selectable_column
    id_column
    column :title
    column :description
    column :priority
    column :due_date
    column :completed
    column :user
    column :created_at
    column :updated_at
    actions defaults: false do |todo_item|
      item "View", admin_todo_item_path(todo_item)
    end
  end

  show do
    attributes_table do
      row :title
      row :description
      row :priority
      row :due_date
      row :completed
      row :user
      row :created_at
      row :updated_at
    end
  end
end
