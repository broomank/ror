require_relative 'instance_counter'

class Station

  include InstanceCounter

  attr_reader :trains, :name

  @@stations = []

  def self.all
    @@stations.each {|station| station}
  end      

  def initialize(name)
    @name = name
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

  def show_trains
    @trains.each { |train| puts "Train number #{train.number}" }
  end
end

