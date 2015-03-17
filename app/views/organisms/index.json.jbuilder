json.array!(@organisms) do |organism|
  json.extract! organism, :id, :tax_org, :name
  json.url organism_url(organism, format: :json)
end
