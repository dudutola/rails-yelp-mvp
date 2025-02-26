# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Faker::Config.locale = "fr"

puts "Deleting all existing reviews..."
Review.delete_all
puts "All reviews deleted."

puts "Deleting all existing restaurants..."
Restaurant.delete_all
puts "All restaurants deleted."

puts "Creating 5 restaurants..."

categories = [ "chinese", "italian", "japanese", "french", "belgian" ]

5.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    category: categories.sample
  )

  restaurant.reviews.create!(
    rating: rand(0..5),
    content: Faker::Restaurant.review
  )
end

puts "5 restaurants created!"
