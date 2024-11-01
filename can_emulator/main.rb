require_relative 'config/emulator'
require_relative './lib/emulator'
require_relative './lib/mazda_rx8_1'
require_relative './lib/j1939_emulator'

def prompt_for_vehicle
  puts "Select the vehicle to emulate:"
  VEHICLE_CONFIG.each do |index, data|
    puts "#{index}. #{data[:name]}"
  end

  choice = gets.chomp.to_i
  if VEHICLE_CONFIG.key?(choice)
    emulator = Object.const_get(VEHICLE_CONFIG[choice][:class_name]).new
    emulator.start
  else
    puts "Invalid choice. Exiting..."
  end
end

prompt_for_vehicle
