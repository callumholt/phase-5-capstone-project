class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :day
  has_many :prescribed_sets
  has_many :completed_sets

end
