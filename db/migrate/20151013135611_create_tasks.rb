class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.date :due_date
      t.references :group, index: true
      t.references :member, index: true

      t.timestamps null: false
    end
    add_foreign_key :tasks, :groups
    add_foreign_key :tasks, :members
  end
end
