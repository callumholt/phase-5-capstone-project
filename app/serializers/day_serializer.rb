class DaySerializer < ActiveModel::Serializer
  attributes :id, :dayNumber
  belongs_to :workout # when i commented this out, it didnt seem to do anything lol
  has_many :exercises
end

