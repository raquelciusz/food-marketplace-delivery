# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database.."
Product.destroy_all

sleep(2)

User.create!(first_name: "Raquel", last_name: "Ciusz", email: "raquel@teste.com", password: 123456, admin: true)

50.times do
  product = Product.create!(
    name: Faker::Food.dish,
    price: rand(20..50),
    description: Faker::Food.description,
    storage: rand(1..30),
    ingredient: Faker::Food.ingredient,
    user_id: 1
  )
  puts "Creating #{product.count} product..."
end
