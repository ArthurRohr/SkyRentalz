class Review < ApplicationRecord
  belongs_to :jet
  belongs_to :user
end
