# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Dose.delete_all
Cocktail.delete_all
Ingredient.delete_all

ingredients_array = ["lemon", "whisky", "gin", "wodka", "cranberry juice", "orange juice", "soda", "coke", "ice", "mint leaves", "tonic"]


ingredients_array.each do |ingredient|

Ingredient.create!(name: ingredient)

end


seed_cocktail = ["wodka lime", "gin tonic"]

seed_cocktail.each do |cocktail|
Cocktail.create!(name: cocktail)

end


dose_helper = [
  {
    description: "2 pieces",
    ingredient: Ingredient.find_by(name: "lemon"),
    cocktail: Cocktail.find_by(name: "wodka lime")
  },
  {
    description: "50cl",
    ingredient: Ingredient.find_by(name: "wodka"),
    cocktail: Cocktail.find_by(name: "wodka lime")
  },
  {
    description: "150ml",
    ingredient: Ingredient.find_by(name: "tonic"),
    cocktail: Cocktail.find_by(name: "gin tonic")
  },
  {
    description: "50ml",
    ingredient: Ingredient.find_by(name: "gin"),
    cocktail: Cocktail.find_by(name: "gin tonic")
  }
]


dose_helper.each do |dose|
  Dose.create!(dose)
end
