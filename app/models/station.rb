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
    @distance = raw_data[:distance]
    @fuel_types = raw_data[:fuel_type_code]
  end
end
