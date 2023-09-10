class WorkoutsController < ApplicationController
  # before_action :set_workout, only: [:show, :update, :destroy]

  # GET /workouts
  
  # def index
  #   @workouts = Workout.includes(day: { exercises: :prescribed_sets })
  #   puts "here is the workout data: #{ActiveModelSerializers::SerializableResource.new(@workouts, include: { day: { include: { exercises: { include: :prescribed_sets } } } }).as_json}"

  #   render json: @workouts, include: {day: { include: :exercises } }
  # end

# DELETE /workouts/1

require 'net/http'
require 'json'
  
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

def openAiCall
  url = URI('https://api.openai.com/v1/chat/completions')
  api_key = ENV['OPEN_AI_KEY']
  
  
  puts "API Key: #{api_key}"
  
  
  headers = {
    'Content-Type' => 'application/json',
    'Authorization' => "Bearer #{api_key}"
  }
  
  # Define the message parameters
  messages = [
    {
      "role": "system",
      "content": "Generate JSON data for a workout plan for a user with the details provided by the user.\n\nall exercises must have reps and weight.\n\nReturn the JSON data using the structure below as an example:\n\nPlease ensure you use different exercises than those in the example.\n\n{{\"user_id\": 4,\"name\":\"User: Bruce - Workout\",\"day\":[{\"id\":1,\"dayNumber\":1,\"exercises\":[{\"id\":1,\"name\":\"Bench Press\",\"prescribed_sets\":[{\"id\":1,\"weight\":\"80.0\",\"reps\":3},{\"id\":2,\"weight\":\"85.0\",\"reps\":3},{\"id\":3,\"weight\":\"90.0\",\"reps\":3}]},{\"id\":2,\"name\":\"Deadlift\",\"prescribed_sets\":[{\"id\":4,\"weight\":\"100.0\",\"reps\":5},{\"id\":5,\"weight\":\"105.0\",\"reps\":5}]}]},{\"id\":2,\"dayNumber\":2,\"exercises\":[{\"id\":3,\"name\":\"Back Squats\",\"prescribed_sets\":[{\"id\":6,\"weight\":\"80.0\",\"reps\":3},{\"id\":7,\"weight\":\"85.0\",\"reps\":3},{\"id\":8,\"weight\":\"90.0\",\"reps\":3}]},{\"id\":4,\"name\":\"Pull-Ups\",\"prescribed_sets\":[{\"id\":9,\"weight\":\"100.0\",\"reps\":5},{\"id\":10,\"weight\":\"105.0\",\"reps\":5}]}]},{\"id\":3,\"dayNumber\":3,\"exercises\":[{\"id\":5,\"name\":\"Push Press\",\"prescribed_sets\":[{\"id\":11,\"weight\":\"80.0\",\"reps\":3},{\"id\":12,\"weight\":\"85.0\",\"reps\":3},{\"id\":13,\"weight\":\"90.0\",\"reps\":3}]},{\"id\":6,\"name\":\"Barbell Rows\",\"prescribed_sets\":[{\"id\":14,\"weight\":\"100.0\",\"reps\":5},{\"id\":15,\"weight\":\"105.0\",\"reps\":5}]}]},{\"id\":4,\"dayNumber\":4,\"exercises\":[{\"id\":7,\"name\":\"Leg Press\",\"prescribed_sets\":[{\"id\":16,\"weight\":\"80.0\",\"reps\":3},{\"id\":17,\"weight\":\"85.0\",\"reps\":3},{\"id\":18,\"weight\":\"90.0\",\"reps\":3}]},{\"id\":8,\"name\":\"Chest Flyes\",\"prescribed_sets\":[{\"id\":19,\"weight\":\"100.0\",\"reps\":5},{\"id\":20,\"weight\":\"105.0\",\"reps\":5}]}]},{\"id\":5,\"dayNumber\":5,\"exercises\":[{\"id\":9,\"name\":\"Dumbbell Curls\",\"prescribed_sets\":[{\"id\":21,\"weight\":\"80.0\",\"reps\":3},{\"id\":22,\"weight\":\"85.0\",\"reps\":3},{\"id\":23,\"weight\":\"90.0\",\"reps\":3}]},{\"id\":10,\"name\":\"Tricep Dips\",\"prescribed_sets\":[{\"id\":24,\"weight\":\"100.0\",\"reps\":5},{\"id\":25,\"weight\":\"105.0\",\"reps\":5}]}]}]}}"
    },
    {
      "role": "user",
      "content": "Please create a workout designed for the user below:\n\nname: Bruce\nuser_id: 4\nFitness goals: gain muscle\nTraining experience: intermediate\nDays per week to train: 5\nTime for each training session: 60 minutes\nInjuries: tight hips\n"
    }
  ]
  
  
  # Create the request
  request = Net::HTTP::Post.new(url)
  request.body = {
    model: 'gpt-3.5-turbo',
    messages: messages,
    temperature: 1,
    temperature: 1,
    max_tokens: 500,
    top_p: 1,
    frequency_penalty: 0,
    presence_penalty: 0
  }.to_json
  request.initialize_http_header(headers)
  
  # Send the request
  response = Net::HTTP.start(url.host, url.port, use_ssl: true) do |http|
    http.request(request)
  end
  
  # Print the response
  puts response.body

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