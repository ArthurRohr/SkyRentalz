class User < ApplicationRecord
  has_many :jets
  has_many :bookings
  has_many :owned_jets, class_name: 'Jet', foreign_key: :user_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
