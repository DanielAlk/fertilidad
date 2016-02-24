json.array!(@practices) do |practice|
  json.extract! practice, :id, :title, :info, :practice_type_id
  json.url practice_url(practice, format: :json)
end
