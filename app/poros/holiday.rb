class Holiday

  attr_reader :date,
              :local_name,
              :name

  def initialize(data)
    @date = data[:date]
    @local_name = data[:localName]
    @name = data[:name]
  end
end
