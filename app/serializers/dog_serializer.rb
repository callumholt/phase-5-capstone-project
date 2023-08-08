class DogSerializer < ActiveModel::Serializer
  attributes :id, :id_of_dog, :primary_key, :id_of_owner, :name_of_dog, :age_of_dog, :breed_of_dog, :bio_of_dog, :location_postCode, :dates_require_dogSitting
end
