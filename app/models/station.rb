class Station
  attr_reader :name,
              :address,
              :access_times,
              :distance,
              :fuel_types

  def initialize(raw_data)
    @name = raw_data[:station_name]
    @address = raw_data[:street_address]
    @access_times = raw_data[:access_days_time]
    @distance = raw_data[:distance].round(2)
    @fuel_types = raw_data[:fuel_type_code]
  end

  def self.create_from_data(data)
    data.map do |station_data|
      Station.new(station_data)
    end
  end
end
