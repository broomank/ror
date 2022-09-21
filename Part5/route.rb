class Route

  attr_accessor :stations, :route_name

  def initialize(route_name, first_station, last_station)
    @route_name = route_name
    @first_station = first_station
    @last_station = last_station
    @stations = [first_station, last_station]
  end

  def add_middle_station(name)
    @stations.insert(-2, name)
  end

  def delete_middle_station(name)
    @stations.delete(name)
  end

  def show_stations
    puts @stations
  end
end




