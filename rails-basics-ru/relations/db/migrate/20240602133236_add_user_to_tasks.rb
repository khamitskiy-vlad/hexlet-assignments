class AddUserToTasks < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :user, null: false, foreign_key: true, index: true
  end
end
