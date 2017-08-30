require 'rails_helper'

describe NrelService do
  it "should return the top 10 stations by distance" do
    VCR.use_cassette('services/stations_by_zip') do
      result = NrelService.stations_by_zip('80203')
      top_station = result[:fuel_stations].first
      expect(result[:fuel_stations].count).to eq(10)
      expect(top_station[:station_name]).to eq('UDR')
      expect(top_station[:access_days_time]).to eq('24 hours daily')
      expect(top_station[:distance]).to eq(0.31422)
    end
  end
end
