class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    # @booking = Booking.find(params[:id])
    @booking = current_user.bookings.find(params[:id])
    #@booking = Booking.where(user_id: current_user.id).where(id: params[:id])
  end

  def new
    @booking = Booking.new
    @jet = Jet.find(params[:jet_id])
    @bookings_all = Booking.where(jet_id: @jet)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @jet = Jet.find(params[:jet_id])
    @booking.jet = @jet
    if @booking.save
      redirect_to bookings_path
      # flash[:notice] = "Booking successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    flash[:notice] = "Booking successfully deleted"
    redirect_to bookings_path(current_user)
  end

  
  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out)
  end
end
