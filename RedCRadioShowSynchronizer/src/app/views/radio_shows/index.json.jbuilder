json.array!(@radio_shows) do |radio_show|
  json.extract! radio_show, :id, :user_id, :name, :description
  json.url radio_show_url(radio_show, format: :json)
end
