# mazda_rx8_message_definitions.rb
# frozen_string_literal: true

module MazdaRx8MessageDefinitions
  # CAN IDs based on reverse engineering of Mazda RX-8 CAN bus messages
  # thanks to https://github.com/DaveBlackH/MazdaRX8Arduino
  MESSAGE_ID_INDICATOR_LIGHTS = 0x650  # ID for Cruise Control Indicator Lights (CAN ID 650)
  MESSAGE_ID_ENGINE_RPM = 0x201        # ID for Engine RPM and related data (CAN ID 201)
  MESSAGE_ID_THROTTLE = 0x201          # ID for Throttle Position (same as CAN ID 201, Byte 7)
  MESSAGE_ID_WARNINGS = 0x420          # ID for Check Engine Light and Warnings (CAN ID 420)
  MESSAGE_ID_SPEED = 0x201             # ID for Vehicle Speed (CAN ID 201, Byte 5 and 6)
  MESSAGE_ID_TRANSMISSION = 0x630      # ID for Transmission Type and Wheel Size (CAN ID 630)
  MESSAGE_ID_OIL_PRESSURE = 0x420      # ID for Oil Pressure (CAN ID 420, Byte 4)

  # Additional notes for clarity on byte/bit mappings
  # CAN ID 201 (Engine RPM, Speed, Throttle Position)
  # - Byte 1-2: Engine RPM
  # - Byte 5-6: Vehicle Speed (formula: (kph * 100) + 10000)
  # - Byte 7: Throttle Position (0-200 in 0.5% increments, scale by 2.5)

  # CAN ID 420 (Warnings and Oil Pressure)
  # - Byte 4: Oil Pressure (Bit 8 MIL for pressure OK status)
  # - Byte 5: Check Engine Light (Bit 7 for MIL, Bit 8 for BL status)

  # CAN ID 650 (Indicator Lights)
  # - Byte 1: Indicator lights for cruise control (0x40 for green, 0x80 for yellow, 0xC0 for both)

  # CAN ID 630 (Transmission and Wheel Size)
  # - Byte 1: Transmission type (0x08 for manual, 0x02 for automatic)
  # - Byte 2: Wheel size (106 in decimal or 0x6A)
end
