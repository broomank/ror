class Train
attr_accessor :speed
attr_reader :type, :number, :wagons
  def initialize(number)
    @number = number
    @type = type
    @speed = 0
    @wagons = []
  end

  def stop
    self.speed = 0
  end

  def get_route(route)
    @route = route
    @position = route.stations.first
  end

  def move_straight
    if @position != @route.stations.last
      @position = self.next_station
    end
  end

  def move_back
    if @position != @route.stations.first
      @position = self.previous_station
    end  
  end

  def previous_station
    @previous_station = @route.stations[@route.stations.index(@position) - 1]
    @previous_station
  end

  def current_station
    @current_station = @position
    @current_station
  end

  def next_station
    @next_station = @route.stations[@route.stations.index(@position) + 1]
    @next_station
  end

  def add_wag(wagon)
    if speed.zero?
      @wagons << wagon
    end
  end

  def remove_wag(wagon)
    if speed.zero?
      @wagons.delete(wagon)
    end
  end
end
