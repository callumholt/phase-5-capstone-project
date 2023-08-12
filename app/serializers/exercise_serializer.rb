class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :day
  has_many :prescribed_sets
end
