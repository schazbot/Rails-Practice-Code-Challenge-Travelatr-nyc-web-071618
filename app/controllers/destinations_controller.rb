class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end

  def show
    @destination = set_destination
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.create(destination_params)

  end

  def edit
    @destination = set_destination
  end

  def update
    @destination = set_destination
    @destination.update
    redirect_to destination_path
  end

  private

  def destination_params
    params.require(:destination).permit(:name, :country)
  end

  def set_destination
    @destination = Destination.find(params[:id])
  end


end
