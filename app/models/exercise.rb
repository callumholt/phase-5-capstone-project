class Exercise < ApplicationRecord
  belongs_to :day
  has_many :prescribed_sets, class_name: 'SetsPrescribed', dependent: :destroy
  has_many :completed_sets, class_name: 'SetsCompleted', dependent: :destroy
end

class SetsPrescribed < ApplicationRecord
  belongs_to :exercise
end

class SetsCompleted < ApplicationRecord
  belongs_to :exercise
end