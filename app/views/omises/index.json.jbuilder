json.array!(@omises) do |omise|
  json.extract! omise, :id, :name, :tel, :address, :homepage
  json.url omise_url(omise, format: :json)
end
