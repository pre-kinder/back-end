class ChildrenSerializer
  include JSONAPI::Serializer

  attributes :first_name, :last_name, :birthday,
             :attendance_status, :parent_id, :classroom_id
end