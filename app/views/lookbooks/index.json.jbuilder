json.array!(@lookbooks) do |lookbook|
  json.extract! lookbook, :id, :user_id, :season, :category, :event, :description, :look, :year
  json.url lookbook_url(lookbook, format: :json)
end
