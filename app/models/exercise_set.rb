class ExerciseSet < ApplicationRecord
  belongs_to :exercise, dependent: :destroy
end
