class JetsController < ApplicationController
  
  def index
    @jets = Jet.all
    @markers = @jets.geocoded.map do |jet|
      {
        lat: jet.latitude,
        lng: jet.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { jet: jet })
      }
    end
  end

  def my_jets
    @jets = current_user.owned_jets
  end

  def show
    @jet = Jet.find(params[:id])
    @markers = [{
      lat: @jet.latitude,
      lng: @jet.longitude
      }]
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
