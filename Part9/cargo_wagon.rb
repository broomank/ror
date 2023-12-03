# frozen_string_literal: true

class CargoWagon < Wagon
  attr_reader :type, :reserved_capacity

  def initialize(capacity)
    super()
    @type = 'cargo'
    @capacity = capacity.to_i
    @reserved_capacity = 0
  end

  def reserve_capacity(volume)
    raise 'There is no free space' if free_capacity <= volume

    @reserved_capacity += volume
  end

  def free_capacity
    @capacity - @reserved_capacity
  end

  def description
    "Number: #{@number}, wagon type: #{@type}, free capacity #{free_capacity}, reserved_capacity: #{reserved_capacity} "
  end
end
