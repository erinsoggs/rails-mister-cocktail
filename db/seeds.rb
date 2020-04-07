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

9.times do
  Cocktail.create(name: Faker::FunnyName.name)
end

# 9.times do
#   url = 'https://www.thecocktaildb.com/api/json/v1/1/random.php'
#   cocktails = open(url).read
#   cocktails_list = JSON.parse(cocktails)
#   photo_url = "https://source.unsplash.com/collection/9459762/#{(1..1000).to_a.sample}"
#   file = URI.open(photo_url)
#   unless names.include? "#{cocktails_list['drinks'][0]['strDrink']}"
#     cocktail = Cocktail.new(
#                   name: "#{cocktails_list['drinks'][0]['strDrink']}",
#                   instructions: "#{cocktails_list['drinks'][0]['strInstructions']}",
#                   )
#     cocktail.photo.attach(io: file, filename: "#{:name}.jpg", content_type: 'image/jpg')
#     cocktail.save
#     num = 1
#     doses = []
#     until num == 15
#       ingredient = cocktails_list['drinks'][0]["strIngredient#{num}"]
#       if ingredient && ingredient != "" && ingredient != "null"
#         doses << "#{cocktails_list['drinks'][0]["strMeasure#{num}"]}:#{cocktails_list['drinks'][0]["strIngredient#{num}"]}"
#       end
#       num += 1
#     end
#     doses.each do |d|
#       a = d.split(':')
#       dose = Dose.new(description: a.first)
#       dose.cocktail_id = cocktail.id
#       if Ingredient.find_by(name: a.last) != nil
#         ing = Ingredient.find_by(name: a.last)
#         dose.ingredient_id = ing.id
#         dose.save
#       end
#     end
#   end
# end
