class Route

  attr_accessor :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_middle_station(middle_name)
    @stations.insert(-2, middle_name)
  end

  def delete_middle_station(middle_name)
    @stations.delete(middle_name)
  end

  def show_stations
    puts @stations
  end
end




