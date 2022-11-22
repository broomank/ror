require_relative 'instance_counter'
require_relative 'validation'

class Station

  include InstanceCounter
  include Validation

  attr_reader :trains, :name

  STATION_NAME = /^[a-z]{1,15}$/i

  @@stations = []

  def self.all
    @@stations
  end      

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@stations << self
    register_instance
  end

  def add_train(train)
    @trains << train
  end
  
  def trains_by(type)
    @trains.select{|train| train.type == type} 
  end

  def send_train(train)
    @trains.delete(train)
  end

  def train_to_block(&block)
    raise 'There is no block' if block_given? == false
    @trains.each { |train| yield(train) }
  end

  def trains_list
    @trains.each { |train| puts "Train number: #{train.number}, train type: #{train.type}, wagons count: #{train.wagon_count} " }
  end



  protected
  
  def validate!
    raise "Incorrect format, use only letters, the length of the title should not exceed 15 characters" if @name !~ STATION_NAME
  end
end

