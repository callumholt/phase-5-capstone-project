class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :postcode
end
