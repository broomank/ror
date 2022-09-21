class Menu
  attr_reader :stations, :trains, :routes

  def initialize
    @stations = []
    @routes =[]
    @trains =[]    
  end
  
  def main_menu
    puts 'enter 1 to create a station'
    puts 'enter 2 to create a train'
    puts 'enter 3 to create a route'
    puts 'enter 4 to add a station to a route'
    puts 'enter 5 to remove a station from a route'
    puts 'enter 6 to set a route for a train'
    puts 'enter 7 to add a wagon'
    puts 'enter 8 to remove a wagon'
    puts 'enter 9 to move a train forward'
    puts 'enter 10 to move a train back'
    puts 'enter 11 to get stations list'
    puts 'enter 12 to get trains list on a station'
    puts 'enter 0 to exit'  
  end

  def menu_choice(choice)
    case choice
    when 1
      create_station
    when 2
      create_train
    when 3
      create_route
    when 4
      add_station
    when 5
      remove_station
    when 6
      set_route
    when 7
      add_wag
    when 8
      remove_wag
    when 9
      move_train_forward
    when 10
      move_train_back
    when 11
      stations_list
    when 12
      trains_on_station_list
    when 0
      abort
    end
  end

  def create_station
    puts 'enter station name'
    name = gets.chomp
    @stations << Station.new(name)
    puts "station #{name} created"
    stations_list
  end

  def create_train
    puts 'enter train number'
    number = gets.chomp.to_i
    puts 'enter train type: cargo or passenger'
    type = gets.chomp
    if type == 'cargo'
      @trains << CargoTrain.new(number)
    elsif type == 'passenger'
      @trains << PassengerTrain.new(number)
    end
  end

  def create_route
    puts 'enter route name'
    route_name = gets.chomp
    puts 'enter first station'
    first_station = gets.chomp
    puts 'enter last station'
    last_station = gets.chomp
    @routes << Route.new(route_name, first_station, last_station)
    @stations << Station.new(first_station)
    @stations << Station.new(last_station)
  end

  def add_station
    @routes.each { |route| puts "#{route.route_name}" }
    puts 'enter route'
    route = gets.chomp
    puts 'enter station name'
    name = gets.chomp
    route_upd = @routes.find { |r| r.route_name == route}
    route_upd.add_middle_station(name)
    puts "Station #{name} added"
    puts "#{route_upd.stations}"
  end

  def remove_station
    @routes.each { |route| puts "#{route.route_name}" }
    puts 'enter route'
    route = gets.chomp
    puts 'enter station name'
    name = gets.chomp
    route_upd = @routes.find { |r| r.route_name == route}
    route_upd.delete_middle_station(name)
    puts "Station #{name} removed"
  end

  def set_route
    @trains.each { |t| puts "#{t.number}" }
    @routes.each { |r| puts "#{r.route_name}" }
    puts 'enter train number'
    number = gets.chomp.to_i
    puts 'enter route name'
    name = gets.chomp
    train = @trains.find { |t| t.number == number}
    route = @routes.find { |r| r.route_name == name}
    train.get_route(route)
    puts "Train #{train.number} set to #{route.route_name} route"
  end

  

  def add_wag 
    puts 'enter train number'
    number = gets.chomp.to_i
    train = @trains.find { |t| t.number == number}     
    if train.type == 'cargo'
      train.add_wag(CargoWagon.new)
    elsif train.type == 'passenger'
      train.add_wag(PassengerWagon.new)
    end
    puts 'wagon added'
    puts "#{train.wagons}" 
  end

  def remove_wag
    puts 'enter train number'
    number = gets.chomp.to_i
    train = @trains.find { |train| train.number == number}
    if train.type == 'cargo'
      train.remove_wag(train.wagons.find {|w| w.type == 'cargo'})
    elsif train.type == 'passenger'
      train.remove_wag(train.wagons.find {|w| w.type == 'passenger'})
    end
    puts 'wagon removed'
  end

  def move_train_forward
    puts 'enter train number'
    number = gets.chomp.to_i
    train = @trains.find { |train| train.number == number}
    train.move_straight
    puts "current_station is #{train.current_station}"
  end

  def move_train_back
    puts 'enter train number'
    number = gets.chomp.to_i
    train = @trains.find { |train| train.number == number}
    train.move_back
    puts "current_station is #{train.current_station}"
  end

  def stations_list
    @stations.each { |station| puts "#{station.name}" }
  end

  def routes_list
    @routes.each { |route| puts "#{route.route_name}" }
  end

  def trains_on_station_list
    puts 'enter station name'
    name = gets.chomp    
    train_on_st = @trains.select { |train| train.position == name}
    train_on_st.each {|train| puts "Train number - #{train.number}" } 
  end
end

