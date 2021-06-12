class FarmsController < ApplicationController
  before_action :set_farm, only: [:show, :update, :destroy]

  # GET /farms
  def index
    @farms = Farm.all

    render json: @farms
  end

  # GET /farms/1
  def show
    render json: @farm
  end

  # POST /farms
  def create
    @farm = Farm.new(farm_params)

    if @farm.save
      render json: @farm, status: :created, location: @farm
    else
      render json: @farm.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /farms/1
  def update
    if @farm.update(farm_params)
      render json: @farm
    else
      render json: @farm.errors, status: :unprocessable_entity
    end
  end

  # DELETE /farms/1
  def destroy
    @farm.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farm
      @farm = Farm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def farm_params
      params.permit(:owner_id,:bird_id,:breed_id,:housing_id,:food_id,:farm_name,:num_of_breeds,:start_date)
    end
end
