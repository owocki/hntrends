json.array!(@sta_items) do |sta_item|
  json.extract! sta_item, :id, :type, :by, :time, :text, :parent, :kids, :url, :score, :title, :parts, :descendants, :updated, :deleted, :dead
  json.url sta_item_url(sta_item, format: :json)
end
