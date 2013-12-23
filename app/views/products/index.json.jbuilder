json.array!(@products) do |product|
  json.extract! product, :id, :avatar, :title, :body
  json.url product_url(product, format: :json)
end
