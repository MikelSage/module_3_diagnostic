class NrelService
  def initialize(zip)
    @zip = zip
    @conn = Faraday.new(url: 'https://developer.nrel.gov/api') do |faraday|
      faraday.request :url_encoded
      faraday.headers['X-Api-Key'] = ENV['nrel_api_key']
      faraday.adapter  Faraday.default_adapter
    end
  end

  def stations_by_zip
    params = {
      location: @zip,
      limit: 10,
      radius: 6.0,
      fuel_types: 'ELEC, LPG'
    }
    get_data('alt-fuel-stations/v1/nearest.json', params)
  end

  def get_data(endpoint, params)
    response = @conn.get(endpoint, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.stations_by_zip(zip)
    new(zip).stations_by_zip
  end
end
