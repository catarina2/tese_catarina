json.array!(@genes) do |gene|
  json.extract! gene, :id, :name, :sequence, :reference, :uniprot, :symbol, :isolated_id
  json.url gene_url(gene, format: :json)
end
