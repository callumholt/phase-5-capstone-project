class SetsCompletedsController < ApplicationController
  before_action :set_sets_completed, only: [:show, :update, :destroy]

  # GET /sets_completeds
  def index
    @sets_completeds = SetsCompleted.all

    render json: @sets_completeds
  end

  # GET /sets_completeds/1
  def show
    render json: @sets_completed
  end

  # POST /sets_completeds
  def create
    @sets_completed = SetsCompleted.new(sets_completed_params)

    if @sets_completed.save
      render json: @sets_completed, status: :created, location: @sets_completed
    else
      render json: @sets_completed.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sets_completeds/1
  def update
    if @sets_completed.update(sets_completed_params)
      render json: @sets_completed
    else
      render json: @sets_completed.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sets_completeds/1
  def destroy
    @sets_completed.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sets_completed
      @sets_completed = SetsCompleted.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sets_completed_params
      params.require(:sets_completed).permit(:exercise_id, :weight, :reps)
    end
end
