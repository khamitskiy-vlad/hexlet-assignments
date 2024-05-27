class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description, null: true
      t.string :creator
      t.string :performer, null: true
      t.string :status, default: :new
      t.boolean :completed, default: true

      t.timestamps
    end
  end
end
