class FramsController < ApplicationController
  before_action :set_fram, only: [:show, :update, :destroy]

  # GET /frams
  def index
    @frams = Fram.all

    render json: @frams
  end

  # GET /frams/1
  def show
    render json: @fram
  end

  # POST /frams
  def create
    @fram = Fram.new(fram_params)

    if @fram.save
      render json: @fram, status: :created, location: @fram
    else
      render json: @fram.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /frams/1
  def update
    if @fram.update(fram_params)
      render json: @fram
    else
      render json: @fram.errors, status: :unprocessable_entity
    end
  end

  # DELETE /frams/1
  def destroy
    @fram.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fram
      @fram = Fram.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fram_params
      params.permit(:owner_id,:bird_id,:breed_id,:housing_id,:)
    end
end
