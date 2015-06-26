class StationsController < ApplicationController 
 
  def index
    t = TrainApi.new
    @info = t.metro_stations 

    b = BikeApi.new
    @bike = b.bike_stations
  end

  def show
    
  end
end