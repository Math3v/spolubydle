class AddAttrsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :done, :boolean
    add_column :tasks, :points, :integer
    add_column :tasks, :points_original, :integer
  end
end
