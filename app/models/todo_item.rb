class TodoItem < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :due_date, presence: true
  validates :priority, presence: true

  scope :by_user, lambda { |user| 
    where(:user_id => user.id)
  }
  def self.ransackable_attributes(auth_object = nil)
    ["completed", "created_at", "description", "due_date", "id", "priority", "title", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end
end
