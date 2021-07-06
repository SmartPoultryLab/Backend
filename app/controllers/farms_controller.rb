class FarmsController < ApplicationController
  before_action :set_farm, only: [:show, :update, :destroy]

  # GET /farms
  def index
    sql = "SELECT farms.id, farms.owner_id, owners.name AS owner_name, "\
          " farms.bird_id,birds.bird_name as bird_name ,"\
          " farms.breed_id,breeds.breed_name as breed_name ,"\
          " farms.housing_id,housings.housingName as housing_name ,"\
          " farms.food_id,foods.food_name as food_name ,"\
          " farms.farm_name,farms.num_of_breeds,farms.start_date"\
          " from farms"\
          " INNER JOIN owners ON owners.id = farms.owner_id"\
          " INNER JOIN birds ON birds.id = farms.bird_id"\
          " INNER JOIN breeds ON breeds.id = farms.breed_id"\
          " INNER JOIN housings ON housings.id = farms.housing_id"\
          " INNER JOIN foods ON foods.id = farms.food_id"\
          " WHERE farms.user_id = #{logged_in_user['id']}"
    @farms = ActiveRecord::Base.connection.exec_query(sql)
    render json: @farms
  end

  # GET /farms/1
  def show
    render json: @farm
  end

  # POST /farms
  def create
    @farm = Farm.new(farm_params)
    @farm.user_id = logged_in_user['id']
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
