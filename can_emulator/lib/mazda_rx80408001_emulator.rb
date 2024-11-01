require_relative 'emulator'

class MazdaRX80408001Emulator < Emulator
  def initialize
    puts "Mazda RX-8 04-08 Variant 1 emulator initialized."
  end

  def start
    super
    # Call CAN message methods or run any other emulation logic here
    send_can_message
  end

  def send_can_message
    super
    puts "Sending Mazda RX-8 specific CAN message to vcan0."
    # Implement CAN message logic here
  end
end