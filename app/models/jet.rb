class Jet < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :users, through: :bookings

  validates :name, :model, :jetType, :capacity, :price, :location, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  has_many_attached :photos
end
