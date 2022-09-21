class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(number)
    @trains << number
  end
  
  def trains_by(type)
    @trains.select{|train| train.type == type} 
  end

  def send_train(number)
    @trains.delete(number)
  end
end

