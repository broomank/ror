class Train
attr_accessor :speed
attr_reader :vag_num, :type
  def initialize(number, type, vag_num)
    @number = number
    @type = type
    @vag_num = vag_num
    @speed = 0
  end

  def stop
    self.speed = 0
  end

  def add_vag 
    if speed == 0
      @vag_num += 1
    end
  end

  def remove_vag
    if speed == 0
      @vag_num -= 1
    end
  end

  def get_route(route)
    @route = route
    @position = route.stations[0]
  end

  def change_station(direction)
    @direction = direction
    if direction == "straight"
      @position = @route.stations[@route.stations.index(@position) + 1]
    elsif direction == "back"
      @position = @route.stations[@route.stations.index(@position) - 1]
    end
  end

  def closes_stations
    @previous_station = @route.stations[@route.stations.index(@position) - 1]
    @current = @position
        @next_station = @route.stations[@route.stations.index(@position) + 1]
    puts @previous_station, @current, @next_station
  end
end



