json.array!(@mutations) do |mutation|
  json.extract! mutation, :id, :nucleotide, :aminoacid, :hgvs
  json.url mutation_url(mutation, format: :json)
end
