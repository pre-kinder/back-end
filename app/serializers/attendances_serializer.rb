class AttendancesSerializer
  include JSONAPI::Serializer

  attributes :date, :notes, :status,
             :child_id, :classroom_id
end
