json.extract! @task, :id, :description, :group_id, :member_id, :created_at, :updated_at, :done, :points, :points_original, :days_per_cycle
json.due_date @task.due_date_date
