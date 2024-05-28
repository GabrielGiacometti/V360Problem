class Task < ApplicationRecord
    has_many :sub_task, foreign_key: "main_task_id", class_name:"Task", dependent: :delete_all
    belongs_to :main_task, class_name: "Task", optional: true
end
