json.array!(@downloads) do |download|
  json.extract! download, :id, :title, :description
  json.url download_url(download, format: :json)
end
