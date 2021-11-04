class Holiday

  attr_reader :date,
              :localName,
              :name
              
  def initialize(data)
    @date = data[:date]
    @localName = data[:localName]
    @name = data[:name]
  end
end
