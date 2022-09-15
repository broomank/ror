class Main
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
    puts 'enter 4 to add a station'
    puts 'enter 5 to remove a station'
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
      add_wagon
    when 8
      remove_wagon
    when 9
      move_forward
    when 10
      move_back
    when 11
      stations_list
    when 12
      trains_list      
    when 0
      abort
    end
  end
end
