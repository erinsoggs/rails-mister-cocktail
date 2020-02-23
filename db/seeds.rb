require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
Ingredient.destroy_all
Cocktail.destroy_all

puts "seeding ingredients"
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
serialized = open(url).read
hash = JSON.parse(serialized)
hash["drinks"].each do |x|
  Ingredient.create(name: x["strIngredient1"])
end

5.times do
  Cocktail.create(name: Faker::FunnyName.name)
end
