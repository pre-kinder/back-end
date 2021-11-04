class HolidayFacade
  class << self
    def holiday(country)
      data = HolidayService.get_yearly_holidays(country)
      data.map do |holiday_info|
        Holiday.new(holiday_info)
      end
    end
  end
end
