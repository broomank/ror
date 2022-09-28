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
    station = Station.new(name)
    @stations << station
    puts "station #{station.name} created"
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
    puts 'enter first station'
    first_station_name = gets.chomp
    puts 'enter last station'
    last_station_name = gets.chomp
    first_station = find_station(first_station_name)
    last_station = find_station(last_station_name)
    return puts 'can\'t find station' if first_station.nil? || last_station.nil?
    route = Route.new(first_station, last_station)
    @routes << route
    puts "Route #{route.name} created"
  end

  def add_station
    routes_list
    puts 'enter route name'
    route_name = gets.chomp
    puts 'enter station name'
    station_name = gets.chomp
    station = find_station(station_name)
    return no_station if station.nil?
    route = find_route(route_name)
    return no_route if route.nil?
    route.add_middle_station(station)
    puts "Station #{station.name} added"
    puts "Stations on the route: #{route.stations.each { |station| puts "#{station.name}" }}"
  end


  def remove_station
    routes_list
    puts 'enter route name'
    route_name = gets.chomp
    puts 'enter station name'
    station_name = gets.chomp
    station = find_station(station_name)
    return no_station if station.nil?
    route = find_route(route_name)
    return no_route if route.nil?   
    route.delete_middle_station(station)
    puts "Station #{station.name} removed"
    puts "Stations on the route: #{route.stations.each { |station| puts "#{station.name}" }}"
  end

  def set_route
    trains_list
    routes_list
    puts 'enter train number'
    number = gets.chomp.to_i
    puts 'enter route name'
    route_name = gets.chomp
    train = find_train(number)
    return no_train if train.nil? 
    route = find_route(route_name)
    return no_route if route.nil? 
    train.set_route(route)
    puts "Train #{train.number} set to #{route.name} route"
  end  

  def add_wag 
    puts 'enter train number'
    number = gets.chomp.to_i
    train = find_train(number)
    return no_train if train.nil? 
    if train.type == 'cargo'
      train.add_wag(CargoWagon.new)
    elsif train.type == 'passenger'
      train.add_wag(PassengerWagon.new)
    end
    puts 'wagon added'
  end

  def remove_wag
    puts 'enter train number'
    number = gets.chomp.to_i
    train = find_train(number)
    return no_train if train.nil? 
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
    train = find_train(number)
    return no_train if train.nil? 
    return puts 'set a route first' if train.route.nil?
    train.move_forward
    puts "current_station is #{train.current_station}"
  end

  def move_train_back
    puts 'enter train number'
    number = gets.chomp.to_i
    train = find_train(number)
    return no_train if train.nil?
    return puts 'set a route first' if train.route.nil?
    train.move_back
    puts "current_station is #{train.current_station}"
  end

  def stations_list
    @stations.each { |station| puts "#{station.name}" }
  end

  def trains_on_station_list
    puts 'enter station name'
    station_name = gets.chomp
    station = find_station(station_name)  
    puts "#{station.show_trains}"
  end

private

  def routes_list
    @routes.each { |route| puts "#{route.name}" }
  end

  def trains_list
    @trains.each { |train| puts "#{train.number}" }
  end

  def find_station(station_name)
    @stations.find { |station| station.name == station_name}
  end

  def find_route(route_name)
    @routes.find { |route| route.name == route_name}
  end

  def no_station
    puts 'there is no such station'
  end

  def no_route
    puts 'there is no such route'
  end

  def find_train(number)
    @trains.find { |train| train.number == number}
  end

  def no_train
    puts 'there is no such train'
  end
end

