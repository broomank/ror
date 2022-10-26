class PassengerTrain < Train
  attr_reader :type, :number

  def initialize(number)
    super(number)
    @type = 'passenger'
  end
end
