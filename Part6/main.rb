require_relative 'menu'
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

menu = Menu.new

loop do 
  menu.main_menu
  selected_choice = gets.to_i
  menu.menu_choice(selected_choice)
  break if selected_choice.zero? 
end
