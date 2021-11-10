class EventSerializer
  include JSONAPI::Serializer

  attributes :title, :description, :date, :time, :classroom_id
end
