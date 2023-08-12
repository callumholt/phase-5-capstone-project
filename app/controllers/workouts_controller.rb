class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :update, :destroy]

  # GET /workouts
  
  def index
    @workouts = Workout.includes(day: { exercises: :prescribed_sets })
    puts "here is the workout data: #{ActiveModelSerializers::SerializableResource.new(@workouts, include: { day: { include: { exercises: { include: :prescribed_sets } } } }).as_json}"

    render json: @workouts, include: {day: { include: :exercises } }
  end

  # render json: @workouts, include: { day: { include: { exercises: { include: :prescribed_sets } } } }


  # def index
  #   @workouts = Workout.includes(day: { exercises: :prescribed_sets })
  #   puts "here is the workout data: #{ActiveModelSerializers::SerializableResource.new(@workouts, include: { day: { include: { exercises: { include: :prescribed_sets } } } }).as_json}"
  #   byebug
  #   render json: @workouts, include: { day: { include: { exercises: { include: :prescribed_sets } } } } 
  # end

  # GET /workouts/1
  def show
    render json: @workout
  end

  # POST /workouts
  def create
    @workout = Workout.new(workout_params)

    if @workout.save
      render json: @workout, status: :created, location: @workout
    else
      render json: @workout.errors, status: :unprocessable_entity
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = Workout.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def workout_params
      params.require(:workout).permit(:user_id, :name)
    end
end
