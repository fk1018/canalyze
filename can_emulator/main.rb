require_relative 'config/emulator'
require_relative './lib/emulator'
require_relative './lib/mazda_rx8_1'
require_relative './lib/j1939_emulator'

def main
  choice = prompt_for_emulator
  start_emulator(choice)
end

def prompt_for_emulator
  puts 'Select the vehicle to emulate:'
  VEHICLE_CONFIG.each do |index, data|
    puts "#{index}. #{data[:name]}"
  end

  gets.chomp.to_i
end

def start_emulator(user_selection)
  if VEHICLE_CONFIG.key?(user_selection)
    emulator = Object.const_get(VEHICLE_CONFIG[user_selection][:class_name]).new
    emulator.start
  else
    puts "Invalid choice of:\t#{user_selection}.\nExiting..."
  end
end

main
