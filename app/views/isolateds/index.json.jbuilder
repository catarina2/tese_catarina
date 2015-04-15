json.array!(@isolateds) do |isolated|
  json.extract! isolated, :id, :name, :disease, :n_samples, :origin_id, :organism_id
  json.url isolated_url(isolated, format: :json)
end
