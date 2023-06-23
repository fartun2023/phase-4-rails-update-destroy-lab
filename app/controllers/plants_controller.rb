class PlantsController < ApplicationController
  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  # PATCH /plants/:id
  def update
    plant = Plant.find(params[:id])
    if plant.update(plant_params)
      render json: plant, status: :ok
    else
      render json: { error: "Failed to update plant" }, status: :unprocessable_entity
    end
  end

  # DELETE /plants/:id
  def destroy
    plant = Plant.find(params[:id])
    if plant.destroy
      head :no_content
    else
      render json: { error: "Failed to delete plant" }, status: :unprocessable_entity
    end
  end

  private

  def plant_params
    params.require(:plant).permit(:is_in_stock)
  end
end