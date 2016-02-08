json.array!(@users) do |user|
  json.extract! user, :id, :userName, :hostName, :emailAddress, :timeServer, :password, :location, :flashTime
  json.url user_url(user, format: :json)
end
