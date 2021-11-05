class HolidayFacade
  class << self
    def next_three_holidays(country)
      data = HolidayService.get_yearly_holidays(country)
    data[0..2].map do |holiday_info|
        Holiday.new(holiday_info)
      end
    end
  end
end
