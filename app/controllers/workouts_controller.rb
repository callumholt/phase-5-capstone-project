class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :update, :destroy]

  # GET /workouts
  
  def index
    @workouts = Workout.includes(day: { exercises: :prescribed_sets })
    puts "here is the workout data: #{ActiveModelSerializers::SerializableResource.new(@workouts, include: { day: { include: { exercises: { include: :prescribed_sets } } } }).as_json}"

    render json: @workouts, include: {day: { include: :exercises } }
  end


  # GET /workouts/1
  def show
    render json: @workout
  end




  def create

    require 'json'

    workout_data = params[:workoutObject] 
    puts "this is the workout_data: #{workout_data}"
    puts "workout_data datatype: #{workout_data.class}"


    # workoutDataJson = JSON.parse(workout_data)


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
  
    workout_data["Days"].each do |day_data|
      day = Day.create!(
        workout_id: workout.id,
        dayNumber: day_data["Day"]
      )
    
  
      day_data["Exercises"].each do |exercise_data|
        exercise = Exercise.create!(
          day_id: day.id,
          name: exercise_data["Exercise"] # Correct key to match JSON structure
        )
  
        exercise_data["Sets"].each do |set_data|
          SetsPrescribed.create!(
            exercise_id: exercise.id,
            weight: set_data["Weight"],
            reps: set_data["Reps"]
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

  # DELETE /workouts/1
  def destroy
    @workout.destroy
  end

 
end