require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destroy_all

 21.times do |i| 
  

  Item.create(title: Faker::Cat.name, description: Faker::Cat.breed, price: rand(0..10)+0.99, image_url: "chat#{i}.jpg")

end
