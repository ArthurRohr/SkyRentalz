class DashboardController < ApplicationController

  def dashboard
    @jets = user_jets
    @bookings = user_bookings
  end

  private

  def user_jets
    @jets = Jet.where(user_id: current_user)
  end

  def user_bookings
    @bookings = Booking.where(user_id: current_user)
  end
end
