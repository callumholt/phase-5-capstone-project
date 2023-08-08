# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all


users = [
  {
    name: "John",
    bio: "I'm a software engineer.",
    postcode: 12345
  },
  {
    name: "Jane",
    bio: "I love hiking and photography.",
    postcode: 67890
  },
  {
    name: "Michael",
    bio: "Food lover and aspiring chef.",
    postcode: 23456
  },
  {
    name: "Emily",
    bio: "Sports enthusiast and avid football fan.",
    postcode: 78901
  },
  {
    name: "Robert",
    bio: "Bookworm, and I can spend hours getting lost in a good novel.",
    postcode: 34567
  },
  {
    name: "Olivia",
    bio: "Passionate about art and painting.",
    postcode: 89012
  },
  {
    name: "William",
    bio: "Music is my life.",
    postcode: 45678
  },
  {
    name: "Sophia",
    bio: "Adventure seeker.",
    postcode: 90123
  },
  {
    name: "David",
    bio: "Animal lover.",
    postcode: 56789
  },
  {
    name: "Emma",
    bio: "Travel addict.",
    postcode: 23456
  }
]

users.each do |user_data|
  User.create(user_data)
  puts "Created user: #{user_data[:name]}"
end

puts "the users are: #{User.attribute}"