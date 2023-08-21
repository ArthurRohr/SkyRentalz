class Jet < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :users, through: :bookings

  validates :name, :model, :type, :capacity, :price, :location, presence: true
end
