class AddDaysPerCycleToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :days_per_cycle, :integer
  end
end
