json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :title, :text
  json.url schedule_url(schedule, format: :json)
end
