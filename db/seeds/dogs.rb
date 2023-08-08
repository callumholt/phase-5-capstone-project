# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Dog.destroy_all

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
      owner_id: "2",
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
      owner_id: "2",
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
      owner_id: "2",
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
      owner_id: "2",
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
      owner_id: "2",
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

  dogs.each do |dog_data|
    Dog.create(dog_data)
    puts "Created Dog: #{dog_data[:name_of_dog]}, and owner_id is #{dog_data[:owner_id]}"
  end

  puts "the dogs are: #{Dog.attribute}"