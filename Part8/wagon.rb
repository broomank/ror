require_relative 'manufacture'

class Wagon
  include Manufacture
  
  attr_reader :type
  attr_accessor :number

  def initialize
    @type = type
  end
end
