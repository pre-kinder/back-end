class TeacherSerializer
  include JSONAPI::Serializer
  attributes :classroom_id, :first_name, :last_name, :email, :address, :phone_number, :google_image_url, :google_id
end
