ActiveAdmin.register TodoItem do
  permit_params :title, :description, :due_date, :priority, :user_id

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :priority
    column :due_date
    column :user
    column :created_at
    actions
  end

  filter :title
  filter :priority
  filter :user
  filter :due_date
  filter :created_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :priority, as: :select, collection: ['High', 'Medium', 'Low']
      f.input :due_date, as: :datetime_picker
      f.input :user, as: :select, collection: User.all
    end
    f.actions
  end
end
