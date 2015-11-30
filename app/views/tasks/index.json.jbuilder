json.array!(@tasks) do |task|
  json.extract! task, :id, :description, :due_date, :group_id, :member_id, :done, :points, :points_original, :days_per_cycle
  json.url task_url(task, format: :json)
end
