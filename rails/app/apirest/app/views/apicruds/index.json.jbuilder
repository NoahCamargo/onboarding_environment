json.array!(@apicruds) do |apicrud|
  json.extract! apicrud, :id, :sku, :name, :description, :amount, :price
  json.url apicrud_url(apicrud, format: :json)
end
