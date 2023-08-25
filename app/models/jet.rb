class Jet < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :users, through: :bookings
  has_many :bookings , dependent: :destroy

  validates :name, :model, :jetType, :capacity, :price, :location, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  has_many_attached :photos

  JETTYPES = ["Turboprop Aircraft", "Helicopter", "Piston Aircraft", "Jet", "Light Jet", "Mid-Size Jet", "Federline Aircraft", "Short-Haul Aircraft", "Water Bomber", "Maritime Patrol"]
end
