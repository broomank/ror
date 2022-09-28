class Route

  attr_accessor :stations
  attr_reader :first_station, :last_station

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [first_station, last_station]
  end

  def add_middle_station(station)
    @stations.insert(-2, station)
  end

  def delete_middle_station(station)
    return puts "you can't remove last or first station" if station == stations.first || station == stations.last
    @stations.delete(station)
  end

  def show_stations
    @stations.each {|station| puts station.name}
  end

  def name
    "#{first_station.name}-#{last_station.name}"
  end
end




