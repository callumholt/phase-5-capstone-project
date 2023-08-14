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

  # POST /workouts

  # def create
  #   @workout = Workout.new(workout_params)

  #   if @workout.save
  #     render json: @workout, status: :created, location: @workout
  #   else
  #     render json: @workout.errors, status: :unprocessable_entity
  #   end
  # end

# First create the user, 
# then create the workout based on the user.id
# then create the days based on the workout.id
# then create the exercises based on the day.id
# then create the prescribed sets based on the exercise.id



  def create

    require 'json'

    workout_data = params[:newWorkout] 
    puts "this is the workout_data: #{workout_data}"

    workoutDataJson = JSON.parse(workout_data)


    user_id = workoutDataJson["user_id"] 
    puts "this is the user_id: #{user_id}"
    puts "this is the workoutDataJson: #{workoutDataJson}"

  
    #this assumes that the user already exists, 
    #and that the user_id is a parameter that is sent in with the workout json

    #this assigns the workout json params to the workout_data variable

    user = User.find(user_id) 
    puts "this is the user: #{user}"

    #this finds and assigns the specific user params from the db to the variable user.
    create_workout(user, workoutDataJson)
    #this calls the create_workout method from the private area below, 
    #using user and workout_data as arguments

    render json: { message: "Workout created successfully!" }, status: :created
  end

  private

  def create_workout(user, workoutDataJson)
    puts "the user id inside the create workout funct: #{user.id}"
    puts "the workout name inside the create workout funct: #{workoutDataJson["workoutObject"]["name"]}"

    workout = Workout.create!(
      user_id: user.id,
      name: workoutDataJson["workoutObject"]["name"] # Correct key to match JSON structure
    )
  
    workoutDataJson["workoutObject"]["Days"].each do |day_data|
      day = Day.create!(
        workout_id: workout.id,
        dayNumber: day_data["Day"] # Correct key to match JSON structure
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

  # private
  #   def set_workout
  #     @workout = Workout.find(params[:id])
  #   end

  #   # Only allow a list of trusted parameters through.
  #   def workout_params
  #     params.permit(
  #       users_attributes: [ :user, :workout,
  #       workouts_attributes: [ :id, :name,
  #         days_attributes: [ :id, :day_number,
  #           exercises_attributes: [ :id, :name,  
  #             prescribed_sets_attributes: [ :set_number, :reps, :weight ] ] ]] ]
        
  #     )
  #   end
end

# params.require(:workout).permit(


# USER
#   has 1 WORKOUT
#     has multi DAYS (1->90)
#       each DAY has multi EXERCISES (squat, deadlift, bench etc)
#         each EXERCISE has multi PRESCRIBED SETS and COMPLETED SETS. 


# name of user {
#   name of workout {
#     Days 1--->90 {
#       exercises for each day {
#         Presribed sets for each exercise on that specific day
#         Completed sets for each exercise on that specific day
#       }
#     }
#   }
# }