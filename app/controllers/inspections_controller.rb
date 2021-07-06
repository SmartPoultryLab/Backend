class InspectionsController < ApplicationController
  before_action :set_inspection, only: [:update, :destroy]
  require 'json'
  # GET /inspections
  def index
    @inspections = Inspection.get_all(logged_in_user['id'])
    render json: @inspections
  end

  # GET /inspections/1
  def show
    @inspection = Inspection.get_by_id(params[:id])
    render json: @inspection,status:200
  end

  # POST /inspections
  def create
    @inspection = Inspection.add_new(params,logged_in_user['id'])
    if @inspection.save
      render json: @inspection, status: :created, location: @inspection
    else
      render json: @inspection.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /inspections/1
  def update
    if Inspection.update_inspection(inspection_params)
      render json: @inspection
    else
      render json: @inspection.errors, status: :unprocessable_entity
    end
  end

  # DELETE /inspections/1
  def destroy
    @inspection.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inspection
      @inspection = Inspection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inspection_params
      params
    end
end
