class HolidaySerializer
  include JSONAPI::Serializer

  attributes :date, :local_name, :name

  def reformat_holiday(holiday)
      {
        id: holiday.id,
        type: 'holiday',
        attributes: {
          date: holiday.date,
          localName: holiday.local_name,
          name: holiday.name,
        }
      }
    end
end
