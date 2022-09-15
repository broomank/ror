require_relative 'train'

class PassengerTrain < Train
  attr_reader :type

  def initialize(number)
    super(number)
    @type = 'passenger'
  end

  def add_wagon(wagon)
    if wagon.type == type
      super
      puts 'wagon added'
    else
      puts 'wrong wagon type'
    end
  end
end
