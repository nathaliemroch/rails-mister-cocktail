require 'open-uri'
require 'json'

puts 'Cleaning database...'
Dose.destroy_all
Ingredient.destroy_all

puts 'Creating ingredients...'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks_serialized = open(url).read
drinks = JSON.parse(drinks_serialized)

drinks["drinks"].each do |drink|
  drink["strIngredient1"]
    Ingredient.create(name: "#{drink["strIngredient1"]}")
end

puts 'Finished!'
