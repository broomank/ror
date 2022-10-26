require_relative 'manufacture'
require_relative 'instance_counter'
require_relative 'validation'

class Train

  include Manufacture
  include InstanceCounter
  include Validation

  
  attr_accessor :speed, :route
  attr_reader :type, :number, :wagons, :current_station

  TRAIN_NUMBER = /^[a-z\d]{3}-?[a-z\d]{2}$/i
  
  @@trains = {}

  def self.find(number)
    raise 'there is no such train' if @@trains[number].nil?
    @@trains[number] 
  end

  def initialize(number)
    @number = number
    validate!
    @type = type
    @speed = 0
    @wagons = []
    @@trains[number] = self
    register_instance  
  end

  def stop
    self.speed = 0
  end

  def set_route(route)
    @route = route
    @current_station = route.stations.first
    @route.stations.first.add_train(self)
  end

  def move_forward
    if @current_station != @route.stations.last
     @current_station.send_train(self)
     @current_station = self.next_station
     @current_station.add_train(self)
    end
  end

  def move_back
    if @current_station != @route.stations.first
      @current_station.send_train(self)
      @current_station = self.previous_station
      @current_station.add_train(self)
    end  
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

  private

  def validate!  
    raise 'incorrect train name/number, please use letters and numbers in the format: XXX-XX/XXXXX' if @number !~ TRAIN_NUMBER
  end

  def previous_station
    @previous_station = @route.stations[@route.stations.index(@current_station) - 1]
    @previous_station
  end

  def next_station
    @next_station = @route.stations[@route.stations.index(@current_station) + 1]
    @next_station
  end  
end
