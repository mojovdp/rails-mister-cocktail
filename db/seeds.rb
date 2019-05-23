# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

puts 'Creating ingredients...'

Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
response_serialised = open(url).read
results = JSON.parse(response_serialised)
# I get the array with all result hashes
ingredients = results['drinks']
ingredients.each do |ingredient|
  # bang, so it doesn't fail silently
  Ingredient.create!(name: ingredient['strIngredient1'])
end

Cocktail.destroy_all

puts 'Creating cocktails...'

cocktails_attributes = [
  {
    name:         'Mojito'
  },
  {
    name:         'White Russian'
  },
  {
    name:         'Bloody Mary'
  },
  {
    name:         'Old Fashioned'
  },
  {
    name:         'Pinha Colada'
  }
]
Cocktail.create!(cocktails_attributes)
