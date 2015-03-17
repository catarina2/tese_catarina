json.array!(@drugs) do |drug|
  json.extract! drug, :id, :reference, :name, :atc, :drugbank
  json.url drug_url(drug, format: :json)
end
