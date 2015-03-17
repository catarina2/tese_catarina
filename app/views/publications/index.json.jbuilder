json.array!(@publications) do |publication|
  json.extract! publication, :id, :author, :title, :date, :journal
  json.url publication_url(publication, format: :json)
end
