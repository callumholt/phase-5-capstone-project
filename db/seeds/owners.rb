# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Owner.destroy_all

owners = [
  { name: "John Doe", email: "john@example.com" },
  { name: "Jane Smith", email: "jane@example.com" },
  { name: "Michael Johnson", email: "michael@example.com" },
  { name: "Emily Davis", email: "emily@example.com" },
  { name: "William Wilson", email: "william@example.com" },
  { name: "Olivia Thompson", email: "olivia@example.com" },
  { name: "James Anderson", email: "james@example.com" },
  { name: "Sophia Martinez", email: "sophia@example.com" },
  { name: "Benjamin Brown", email: "benjamin@example.com" },
  { name: "Ava Taylor", email: "ava@example.com" }
]

owners.each do |owner_data|
  Owner.create(owner_data)
  puts "Created Owner: #{owner_data[:name]}, owner data: #{owner_data}"
end

puts "the owners are: #{Owner.attribute}"
