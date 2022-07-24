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
    if speed.zero?
      @vag_num += 1
    end
  end

  def remove_vag
    if speed.zero?
      @vag_num -= 1
    end
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
end
