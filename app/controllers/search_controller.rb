class SearchController < ApplicationController
  def index
    results = NrelService.stations_by_zip(params[:search_box])
    @stations = results[:fuel_stations].map do |data|
      Station.new(data)
    end
  end
end
