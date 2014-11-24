json.array!(@attachments) do |attachment|
  json.extract! attachment, :id, :name, :content
  json.url attachment_url(attachment, format: :json)
end
