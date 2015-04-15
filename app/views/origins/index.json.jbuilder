json.array!(@origins) do |origin|
  json.extract! origin, :id, :origin_t, :lab_name
  json.url origin_url(origin, format: :json)
end
