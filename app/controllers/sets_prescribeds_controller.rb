class SetsPrescribedsController < ApplicationController
  before_action :set_sets_prescribed, only: [:show, :update, :destroy]

  # GET /sets_prescribeds
  def index
    @sets_prescribeds = SetsPrescribed.all

    render json: @sets_prescribeds
  end

  # GET /sets_prescribeds/1
  def show
    render json: @sets_prescribed
  end

  # POST /sets_prescribeds
  def create
    @sets_prescribed = SetsPrescribed.new(sets_prescribed_params)

    if @sets_prescribed.save
      render json: @sets_prescribed, status: :created, location: @sets_prescribed
    else
      render json: @sets_prescribed.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sets_prescribeds/1
  def update
    if @sets_prescribed.update(sets_prescribed_params)
      render json: @sets_prescribed
    else
      render json: @sets_prescribed.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sets_prescribeds/1
  def destroy
    @sets_prescribed.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sets_prescribed
      @sets_prescribed = SetsPrescribed.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sets_prescribed_params
      params.require(:sets_prescribed).permit(:exercise_id, :weight, :reps)
    end
end
