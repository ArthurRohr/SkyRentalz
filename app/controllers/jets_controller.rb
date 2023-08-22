class JetsController < ApplicationController
  def index
    @jets = Jet.all
  end

  def show
    @jet = Jet.find(params[:id])
  end

  def new
    @jet = Jet.new
  end

  def create
    @jet = Jet.new(jet_params)
    @jet.user = current_user
    if @jet.save
      redirect_to jet_path(@jet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def jet_params
    params.require(:jet).permit(:name, :model, :capacity, :jetType, :location, :price, photos: [])
  end

end
