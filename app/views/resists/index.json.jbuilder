json.array!(@resists) do |resist|
  json.extract! resist, :id, :reference, :mic, :drug_id, :isolated_id
  json.url resist_url(resist, format: :json)
end
