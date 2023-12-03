# frozen_string_literal: true

class PassengerWagon < Wagon
  attr_reader :type, :booked_seats

  def initialize(seats_number)
    super()
    @type = 'passenger'
    @seats_number = seats_number.to_i
    @booked_seats = 0
  end

  def take_seat
    raise 'There are no free seats' if free_seats <= 0

    @booked_seats += 1
  end

  def free_seats
    @seats_number - booked_seats
  end

  def description
    "Wagon number: #{@number}, wagon type: #{@type}, free seats: #{free_seats}, booked_seats: #{booked_seats} "
  end
end
