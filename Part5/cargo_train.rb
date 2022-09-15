require_relative 'train'

class CargoTrain < Train
  attr_reader :type

  def initialize(number)
    super(number)
    @type = 'cargo'
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
