# frozen_string_literal: true

require_relative 'emulator'

# J1939Emulator
class J1939Emulator
  include Emulator

  def start
    puts "Starting #{self.class}"
  end
end
