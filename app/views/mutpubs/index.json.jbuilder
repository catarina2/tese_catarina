json.array!(@mutpubs) do |mutpub|
  json.extract! mutpub, :id, :mutation_id, :publication_id
  json.url mutpub_url(mutpub, format: :json)
end
