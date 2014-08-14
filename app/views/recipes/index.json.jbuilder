json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :title, :coffee, :water, :seconds, :description
  json.url recipe_url(recipe, format: :json)
end
