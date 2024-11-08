# frozen_string_literal: true

require_relative 'config/emulator'
require_relative 'lib/emulator'
require_relative 'lib/mazda_rx8_emulator'
require_relative 'lib/j1939_emulator'

def main
  start_emulator
end

def start_emulator
  emulator = Object.const_get(EMULATOR).new
  emulator.start
rescue StandardError
  puts 'Unable to start emulator please check config/emulator.rb'
end

main
