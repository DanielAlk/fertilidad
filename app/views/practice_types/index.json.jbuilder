json.array!(@practice_types) do |practice_type|
  json.extract! practice_type, :id, :title
  json.url practice_type_url(practice_type, format: :json)
end
