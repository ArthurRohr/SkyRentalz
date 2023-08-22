class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
  end


  def new
    @booking = Booking.new
    @jet = Jet.find(params[:jet_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @jet = Jet.find(params[:jet_id])
    @booking.jet = @jet
    if @booking.save
      redirect_to booking_path(@booking)
      flash[:notice] = "Booking successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end




  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out)
  end
end
