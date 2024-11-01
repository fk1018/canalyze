require_relative 'emulator'

class J1939Emulator < Emulator
  def initialize
  end
  def start
    super
    # Call CAN message methods or run any other emulation logic here
    send_can_message
  end

  def send_can_message
    super
    puts 'Sending J1939Emulator specific CAN message to vcan0.'
    # Implement CAN message logic here
  end
end
