class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :user
  has_many :day

end
