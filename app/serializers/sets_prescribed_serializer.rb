class SetsPrescribedSerializer < ActiveModel::Serializer
  attributes :id, :weight, :reps
  has_one :exercise
end
