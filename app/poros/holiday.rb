class Holiday

  attr_reader :date,
              :local_name,
              :name,
              :id

  def initialize(data)
    @date = data[:date]
    @local_name = data[:localName]
    @name = data[:name]
  end

  def id
    @date.tr('-', '')
  end
end
