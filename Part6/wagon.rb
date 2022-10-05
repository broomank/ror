class Wagon
  include Manufacture
  
  attr_reader :type

  def initialize
    @type = type
  end
end
