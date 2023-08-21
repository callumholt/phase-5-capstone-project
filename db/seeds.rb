# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

SetsCompleted.destroy_all
SetsPrescribed.destroy_all
Exercise.destroy_all
Day.destroy_all
Workout.destroy_all
User.destroy_all


# Create Users
user = User.create!(
  name: 'John Doe',
  email: 'john@example.com',
  password: 'password',
  password_confirmation: 'password'
)

# Create Workout
workout = Workout.create!(
  user_id: user.id,
  name: "User: #{user.name} - Workout"
)

# Create Days and Exercises
(1..90).each do |day_number|
  day = Day.create!(
    workout_id: workout.id,
    dayNumber: day_number
  )

  exercise1 = Exercise.create!(
    day_id: day.id,
    name: 'Back Squats'
  )

  exercise2 = Exercise.create!(
    day_id: day.id,
    name: 'Romanian Deadlifts'
  )

  # Create Prescribed Exercise Sets
  SetsPrescribed.create!(
    exercise_id: exercise1.id,
    weight: 80.0,
    reps: 3
  )

  SetsPrescribed.create!(
    exercise_id: exercise1.id,
    weight: 85.0,
    reps: 3
  )

  SetsPrescribed.create!(
    exercise_id: exercise1.id,
    weight: 90.0,
    reps: 3
  )

  SetsPrescribed.create!(
    exercise_id: exercise2.id,
    weight: 100.0,
    reps: 5
  )

  SetsPrescribed.create!(
    exercise_id: exercise2.id,
    weight: 105.0,
    reps: 5
  )
end

puts "Users count: #{User.count}"
puts "Workout count: #{Workout.count}"
puts "Day count: #{Day.count}"
puts "Exercise count: #{Exercise.count}"
puts "SetsPrescribed count: #{SetsPrescribed.count}"
puts "SetsCompleted count: #{SetsCompleted.count}"  # Update to the appropriate name if you've renamed the table

puts "Data seeding complete!"

