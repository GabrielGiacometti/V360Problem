class Task < ApplicationRecord
    scope :ordered, ->{order(created_at: :desc)}
    has_many :sub_task, foreign_key: "main_task_id", class_name:"Task", dependent: :destroy
    belongs_to :main_task, class_name: "Task", optional: true
    validates :title, presence:true
end
