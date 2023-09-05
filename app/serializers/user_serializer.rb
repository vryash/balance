class UserSerializer
  include JSONAPI::Serializer

  attributes :name, :balance
end
