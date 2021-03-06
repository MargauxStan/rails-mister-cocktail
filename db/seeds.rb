# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'


puts "seeding ingredients"
# Ingredient.destroy_all
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
doc = open(url).read
list =  JSON.parse(doc)
list =  list["drinks"]
list.each do |ing|
  Ingredient.create!(name: ing.values[0])
end

Ingredient.create!(name: "Coke")
Ingredient.create!(name: "Gin")
Ingredient.create!(name: "Martini")

puts "seeding done"