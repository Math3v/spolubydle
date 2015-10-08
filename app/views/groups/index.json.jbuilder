json.array!(@groups) do |group|
  json.extract! group, :id, :name, :code, :settings
  json.url group_url(group, format: :json)
end
