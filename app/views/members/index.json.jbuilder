json.array!(@members) do |member|
  json.extract! member, :id, :name, :admin, :group_id, :color_id,
  :points
  json.url member_url(member, format: :json)
end
