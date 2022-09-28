class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
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

