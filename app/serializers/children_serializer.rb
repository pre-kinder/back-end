class ChildrenSerializer
  include JSONAPI::Serializer

  attributes :first_name, :last_name, :birthday,
             :parent_id, :classroom_id
end
