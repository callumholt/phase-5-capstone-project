# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


//

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Owner.destroy_all
Dog.destroy_all

users = [
  { name: "John", bio: "I'm a software engineer.", postcode: 12345 },
  { name: "Jane", bio: "I love hiking and photography.", postcode: 67890 },
  { name: "Michael", bio: "Food lover and aspiring chef.", postcode: 23456 },
  { name: "Emily", bio: "Sports enthusiast and avid football fan.", postcode: 78901 },
  { name: "Robert", bio: "Bookworm, and I can spend hours getting lost in a good novel.", postcode: 34567 },
  { name: "Olivia", bio: "Passionate about art and painting.", postcode: 89012 },
  { name: "William", bio: "Music is my life.", postcode: 45678 },
  { name: "Sophia", bio: "Adventure seeker.", postcode: 90123 },
  { name: "David", bio: "Animal lover.", postcode: 56789 },
  { name: "Emma", bio: "Travel addict.", postcode: 23456 }
]

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

dogs = [
  {
    id_of_dog: 1,
    owner_id: "2",
    primary_key: "abcd1234",
    id_of_owner: 1,
    name_of_dog: "Max",
    age_of_dog: 3,
    breed_of_dog: "Labrador Retriever",
    bio_of_dog: "Friendly and playful",
    location_postCode: 12345,
    dates_require_dogSitting: "2023-06-21, 2023-06-22"
  },
  {
    id_of_dog: 2,
    owner_id: "3",
    primary_key: "efgh5678",
    id_of_owner: 2,
    name_of_dog: "Bella",
    age_of_dog: 5,
    breed_of_dog: "Golden Retriever",
    bio_of_dog: "Loves long walks",
    location_postCode: 67890,
    dates_require_dogSitting: "2023-06-23, 2023-06-24"
  },
  {
    id_of_dog: 3,
    owner_id: "6",
    primary_key: "ijkl9012",
    id_of_owner: 3,
    name_of_dog: "Charlie",
    age_of_dog: 2,
    breed_of_dog: "French Bulldog",
    bio_of_dog: "Enjoys cuddling",
    location_postCode: 23456,
    dates_require_dogSitting: "2023-06-25, 2023-06-26"
  },
  {
    id_of_dog: 4,
    owner_id: "4",
    primary_key: "mnop3456",
    id_of_owner: 4,
    name_of_dog: "Lucy",
    age_of_dog: 4,
    breed_of_dog: "Poodle",
    bio_of_dog: "Smart and obedient",
    location_postCode: 78901,
    dates_require_dogSitting: "2023-06-27, 2023-06-28"
  },
  {
    id_of_dog: 5,
    owner_id: "1",
    primary_key: "qrst7890",
    id_of_owner: 5,
    name_of_dog: "Cooper",
    age_of_dog: 1,
    breed_of_dog: "Border Collie",
    bio_of_dog: "Energetic and intelligent",
    location_postCode: 34567,
    dates_require_dogSitting: "2023-06-29, 2023-06-30"
  },
  {
    id_of_dog: 6,
    owner_id: "3",
    primary_key: "uvwx2345",
    id_of_owner: 6,
    name_of_dog: "Lola",
    age_of_dog: 6,
    breed_of_dog: "Shih Tzu",
    bio_of_dog: "Likes to be pampered",
    location_postCode: 89012,
    dates_require_dogSitting: "2023-07-01, 2023-07-02"
  },
  {
    id_of_dog: 7,
    owner_id: "2",
    primary_key: "yzab6789",
    id_of_owner: 7,
    name_of_dog: "Rocky",
    age_of_dog: 2,
    breed_of_dog: "Boxer",
    bio_of_dog: "Strong and loyal",
    location_postCode: 45678,
    dates_require_dogSitting: "2023-07-03, 2023-07-04"
  },
  {
    id_of_dog: 8,
    owner_id: "2",
    primary_key: "cdef1234",
    id_of_owner: 8,
    name_of_dog: "Molly",
    age_of_dog: 7,
    breed_of_dog: "Bulldog",
    bio_of_dog: "Loves to nap",
    location_postCode: 90123,
    dates_require_dogSitting: "2023-07-05, 2023-07-06"
  },
  {
    id_of_dog: 9,
    owner_id: "2",
    primary_key: "ghij5678",
    id_of_owner: 9,
    name_of_dog: "Bailey",
    age_of_dog: 3,
    breed_of_dog: "Siberian Husky",
    bio_of_dog: "Enjoys outdoor activities",
    location_postCode: 56789,
    dates_require_dogSitting: "2023-07-07, 2023-07-08"
  },
  {
    id_of_dog: 10,
    owner_id: "2",
    primary_key: "klmn9012",
    id_of_owner: 10,
    name_of_dog: "Daisy",
    age_of_dog: 2,
    breed_of_dog: "Beagle",
    bio_of_dog: "Loves to explore",
    location_postCode: 23456,
    dates_require_dogSitting: "2023-07-09, 2023-07-10"
  }
]

users.each do |user_data|
    user = User.create(user_data)
    puts "Created User: #{user.name}"
  end
  
  owners.each do |owner_data|
    owner = Owner.create(owner_data)
    puts "Created Owner: #{owner.name} and owner id: #{owner.id}"
  end
  
  dogs.each do |dog_data|
    owner = Owner.first
    puts "the owner data is #{owner.id}"
    
    #dog_data[:owner_id]
  
    if owner
        puts "the owner is Truthy!"
      dog = Dog.new(dog_data)
      owner.dogs << dog
      puts "Created Dog: #{dog.name_of_dog} and owner is: #{owner.name}"
    else
        puts "the owner is falsy!"

      puts "Owner not found for dog: #{dog_data[:name]}"
    end
  end
  
  puts "Users count: #{User.count}"
  puts "Dogs count: #{Dog.count}"
  puts "Owners count: #{Owner.count}"
  
  puts "Data seeding complete!"
  
