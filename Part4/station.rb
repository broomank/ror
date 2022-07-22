class Station
  attr_reader :trains

  def initialize(station_name)
    @station_name = station_name
    @trains = []
  end

  def add_train(train_name)
    @trains << train_name
  end
  
  def trains_by_type
    hash = Hash.new(0)
    @trains.each { |train| hash[train.type] += 1 }
    hash
  end

  def send_train(train_name)
    @trains.delete(train_name)
  end
end




