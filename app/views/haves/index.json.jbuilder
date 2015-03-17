json.array!(@haves) do |hafe|
  json.extract! hafe, :id, :mutation_id, :publication_id
  json.url hafe_url(hafe, format: :json)
end
