# can_socket.rb
# frozen_string_literal: true

# CanSocket

# The CanSocket class provides an interface to send CAN messages using the `cansend` command.
#
# @example
#   socket = CanSocket.new('can0')
#   socket.send_message(0x123, [0xDE, 0xAD, 0xBE, 0xEF])
#
# @param [String] interface The CAN interface to use (e.g., 'can0').
class CanSocket
  # Initializes a new CanSocket instance.
  #
  # @param [String] interface The CAN interface to use (e.g., 'can0').
  def initialize(interface)
    @interface = interface
  end

  # Sends a CAN message using the `cansend` command.
  #
  # @param [Integer] id The CAN ID of the message.
  # @param [Array<Integer>] data The data bytes of the CAN message.
  #
  # @example
  #   socket.send_message(0x123, [0xDE, 0xAD, 0xBE, 0xEF])
  #
  # @return [void]
  def send_message(id, data)
    hex_id = format('%03X', id) # ID formatted as a 3-digit hexadecimal
    hex_data = data.map { |byte| format('%02X', byte) }.join # Data bytes as hex
    command = "cansend #{@interface} #{hex_id}##{hex_data}"
    system(command) # Sends the CAN message using cansend
  end
end
