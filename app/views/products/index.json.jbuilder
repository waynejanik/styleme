json.array!(@products) do |product|
  json.extract! product, :id, :product, :price, :description
  json.url product_url(product, format: :json)
end
