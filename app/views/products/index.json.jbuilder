json.array!(@products) do |product|
  json.extract! product, :id, :name, :calories, :protein, :fat, :carbs, :ingredient_id
  json.url product_url(product, format: :json)
end
