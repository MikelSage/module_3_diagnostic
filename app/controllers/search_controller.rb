class SearchController < ApplicationController
  def index
    @results = NrelService.stations_by_zip(params[:search_box])
    @stations = results.map do ||
      
    end
  end
end
