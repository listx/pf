json.array!(@journals) do |journal|
  json.extract! journal, :id, :name, :avatar, :priority, :integer
  json.url journal_url(journal, format: :json)
end
