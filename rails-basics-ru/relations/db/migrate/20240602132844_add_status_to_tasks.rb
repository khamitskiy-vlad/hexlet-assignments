class AddStatusToTasks < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :status, null: false, foreign_key: true, index: false
  end
end
