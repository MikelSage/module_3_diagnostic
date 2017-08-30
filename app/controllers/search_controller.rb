class SearchController < ApplicationController
  def index
    results = NrelService.stations_by_zip(params[:search_box])[:fuel_stations]
    @stations = Station.create_from_data(results)
  end
end
