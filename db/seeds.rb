# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
CATEGORIES = [ "chinese", "italian", "japanese", "french", "belgian" ]

puts 'Creating 5 fake restaurants...'
5.times do
  restaurant = Restaurant.new(
    name: Faker::Company.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    phone_number: Faker::PhoneNumber.phone_number,
    category: CATEGORIES.sample
  )
  restaurant.save!

  rand(1..4).times do
    Review.create!(restaurant: restaurant, content: Faker::Restaurant.review, rating: rand(0..5))
  end
end
puts 'Finished!'
