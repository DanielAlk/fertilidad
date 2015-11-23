json.array!(@instructionals) do |instructional|
  json.extract! instructional, :id, :title, :text
  json.url instructional_url(instructional, format: :json)
end
