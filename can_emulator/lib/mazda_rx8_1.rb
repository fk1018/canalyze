# frozen_string_literal: true

require_relative 'emulator'

# MazdaRx81Emulator
class MazdaRx81Emulator
  include Emulator
  def initialize; end

  def start
    puts "Starting #{self.class}"
  end
end
