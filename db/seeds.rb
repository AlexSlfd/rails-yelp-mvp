# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# require 'faker'
puts "Cleaning database..."
Restaurant.destroy_all

CATEGORIES = %w[chinese italian japanese french belgian]

5.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    phone_number: Faker::Number.number(digits: 10),
    category: CATEGORIES.sample
  )

  if restaurant.save
    5.times do
      review = Review.new(
        rating: rand(0..5),
        content: Faker::Restaurant.description
      )
      review.restaurant = restaurant
      review.save!
    end
  end
end
