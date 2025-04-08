class TodoItem < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :due_date, presence: true
  validates :priority, presence: true

  scope :by_user, lambda { |user| 
    where(:user_id => user.id)
  }
end
