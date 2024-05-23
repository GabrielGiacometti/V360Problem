class AddMainTaskToTask < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :main_task, foreign_key: {to_table: :tasks}
  end
end
