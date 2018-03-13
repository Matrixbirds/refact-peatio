class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password, :phone
end
