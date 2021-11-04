class HolidayService < BaseService
  class << self
    def get_yearly_holidays(country)
      response = BaseService.conn("https://date.nager.at").get("/api/v3/NextPublicHolidays/#{country}")
      parse_json(response)
    end
  end
end
