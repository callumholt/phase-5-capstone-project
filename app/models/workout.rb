class Workout < ApplicationRecord
  belongs_to :user
  has_many :day, dependent: :destroy
end
