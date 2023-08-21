class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :jet

  validates :check_in, :check_out, presence: true
end
