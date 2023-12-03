# frozen_string_literal: true

require_relative 'manufacture'
require_relative 'instance_counter'
require_relative 'validation'

class Train
  include Manufacture
  include InstanceCounter
  include Validation

  attr_accessor :speed
  attr_reader :type, :number, :wagons, :current_station

  TRAIN_NUMBER = /^[a-z\d]{3}-?[a-z\d]{2}$/i.freeze

  @trains = {}

  def self.find(number)
    raise 'there is no such train' if @@trains[number].nil?

    @trains[number]
  end

  def initialize(number)
    @number = number
    validate!
    @type = type
    @speed = 0
    @wagons = []
    @trains[number] = self
    register_instance
  end

  def stop
    self.speed = 0
  end

  def route=(route)
    @route = route
    @current_station = route.stations.first
    @route.stations.first.add_train(self)
  end

  def move_forward
    return unless @current_station != @route.stations.last

    @current_station.send_train(self)
    @current_station = next_station
    @current_station.add_train(self)
  end

  def move_back
    return unless @current_station != @route.stations.first

    @current_station.send_train(self)
    @current_station = previous_station
    @current_station.add_train(self)
  end

  def add_wag(wagon)
    return unless speed.zero?

    wagon.number = wagon_count + 1
    @wagons << wagon
  end

  def remove_wag(wagon)
    return unless speed.zero?

    @wagons.delete(wagon)
  end

  def find_wagon(number)
    @wagons.find { |wagon| wagon.number == number }
  end

  def wagon_to_block(&block)
    raise 'There is no block' if block_given? == false

    @wagons.each(&block)
  end

  def wagon_count
    @wagons.length
  end

  private

  def validate!
    return unless @number !~ TRAIN_NUMBER

    raise 'incorrect train name/number, please use letters and numbers in the format: XXX-XX/XXXXX'
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
