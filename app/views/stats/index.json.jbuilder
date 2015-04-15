json.array!(@stats) do |stat|
  json.extract! stat, :id, :n_studies, :info, :gene_id, :mutation_id
  json.url stat_url(stat, format: :json)
end
