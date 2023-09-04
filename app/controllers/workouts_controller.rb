class WorkoutsController < ApplicationController
  # before_action :set_workout, only: [:show, :update, :destroy]

  # GET /workouts
  
  # def index
  #   @workouts = Workout.includes(day: { exercises: :prescribed_sets })
  #   puts "here is the workout data: #{ActiveModelSerializers::SerializableResource.new(@workouts, include: { day: { include: { exercises: { include: :prescribed_sets } } } }).as_json}"

  #   render json: @workouts, include: {day: { include: :exercises } }
  # end

# DELETE /workouts/1
  
def destroy
  workout = Workout.find_by(user_id: params[:id])
  puts "the id of user is: #{workout.user_id}"
  associated_days = workout.day
  associated_exercises = Day.where(workout: workout).joins(:exercises)

  if !associated_days.empty? && !associated_exercises.empty?
    puts "Cannot delete the workout because it has associated days and exercises."
    head :unprocessable_entity # Or you can choose an appropriate HTTP status code
  elsif !associated_days.empty?
    puts "Cannot delete the workout because it has associated days."
    head :unprocessable_entity # Or you can choose an appropriate HTTP status code
  elsif !associated_exercises.empty?
    puts "Cannot delete the workout because it has associated exercises."
    head :unprocessable_entity # Or you can choose an appropriate HTTP status code
  else
    workout.destroy
    puts "The workout has been successfully deleted."
    head :no_content
  end
end

  
  def show

    @workout = Workout.includes(day: { exercises: [:prescribed_sets, :completed_sets] }).find_by(user_id: params[:id])

    puts "here is the workout data inside show: #{ActiveModelSerializers::SerializableResource.new(@workout, include: { day: { include: { exercises: {include: [:prescribed_sets, :completed_sets] } } } }).as_json}"

    render json: @workout,include: { day: { exercises: [:prescribed_sets, :completed_sets] } }

  end
  

  def set_workout
    @workout = Workout.find(params[:id])
  end


  def create

    require 'json'

    workout_data = params 
    puts "this is the workout_data: #{workout_data}"
    puts "workout_data datatype: #{workout_data.class}"

    user_id = workout_data["user_id"] 
    puts "this is the user_id: #{user_id}"


    user = User.find(user_id) 
    puts "this is the user: #{user}"

    create_workout(user, workout_data)

    render json: { message: "Workout created successfully!" }, status: :created
  end

  private

  def create_workout(user, workout_data)
    puts "the user id inside the create workout funct: #{user.id}"
    puts "the workout name inside the create workout funct: #{workout_data["name"]}"

    workout = Workout.create!(
      user_id: user.id,
      name: workout_data["name"]
    )
  
    workout_data["day"].each do |day_data|
      day = Day.create!(
        workout_id: workout.id,
        dayNumber: day_data["dayNumber"]
      )
    
  
      day_data["exercises"].each do |exercise_data|
        exercise = Exercise.create!(
          day_id: day.id,
          name: exercise_data["name"] # Correct key to match JSON structure
        )
  
        exercise_data["prescribed_sets"].each do |set_data|
          SetsPrescribed.create!(
            exercise_id: exercise.id, # Use exercise.id instead of prescribed_sets.id
            weight: set_data["weight"], # Use set_data to access the weight
            reps: set_data["reps"] # Use set_data to access the reps
          )
        end
        
      end
    end
  end
  

  # PATCH/PUT /workouts/1
  def update
    if @workout.update(workout_params)
      render json: @workout
    else
      render json: @workout.errors, status: :unprocessable_entity
    end
  end

  

 
end