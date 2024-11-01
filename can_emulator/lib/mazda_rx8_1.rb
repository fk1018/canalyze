require_relative 'emulator'

class MazdaRx81Emulator < Emulator
  def initialize
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
