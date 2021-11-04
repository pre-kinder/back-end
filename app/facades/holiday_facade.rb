class HolidayFacade
  class << self
    def holiday(country)
      data = HolidayService.get_yearly_holidays(country)
      data.map do |holiday|
        Holiday.new
      end
    end
  end
end
