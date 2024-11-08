# mazda_rx8_message_generator.rb
# frozen_string_literal: true

require_relative 'mazda_rx8_message_definitions'

# MazdaRx8MessageGenerator
class MazdaRx8MessageGenerator
  include MazdaRx8MessageDefinitions

  def indicator_lights_message
    # Cruise Control Indicator (CAN ID 650, Byte 1)
    { id: MESSAGE_ID_INDICATOR_LIGHTS, data: [0x40] } # Green light as an example
  end

  def engine_rpm_message(rpm)
    # Engine RPM (CAN ID 201, Bytes 1-2)
    raw_data = (rpm / 3.85).to_i # Convert RPM to raw data format
    { id: MESSAGE_ID_ENGINE_RPM, data: [raw_data >> 8, raw_data & 0xFF] }
  end

  def throttle_position_message(position_percent)
    # Throttle Position (CAN ID 201, Byte 7)
    raw_data = (position_percent * 2.5).to_i # Scale percentage to match 0-200 range
    { id: MESSAGE_ID_THROTTLE, data: [0, 0, 0, 0, 0, 0, raw_data] }
  end

  def check_engine_light_message(on)
    # Check Engine Light (CAN ID 420, Byte 5)
    data = on ? 0x80 : 0x00 # 0x80 to activate MIL on Bit 7
    { id: MESSAGE_ID_WARNINGS, data: [0, 0, 0, 0, data] }
  end

  def vehicle_speed_message(kph)
    # Vehicle Speed (CAN ID 201, Bytes 5-6)
    raw_speed = ((kph * 100) + 10_000).to_i # Scale and adjust speed value
    { id: MESSAGE_ID_SPEED, data: [0, 0, 0, 0, raw_speed >> 8, raw_speed & 0xFF] }
  end

  def transmission_message(transmission_type)
    # Transmission Type and Wheel Size (CAN ID 630)
    transmission_data = transmission_type == 'manual' ? 0x08 : 0x02
    wheel_size_data = 0x6A # 106 in decimal
    { id: MESSAGE_ID_TRANSMISSION, data: [transmission_data, wheel_size_data] }
  end

  def oil_pressure_message(pressure_ok)
    # Oil Pressure (CAN ID 420, Byte 4, Bit 8 for MIL)
    data = pressure_ok ? 0x01 : 0x00
    { id: MESSAGE_ID_OIL_PRESSURE, data: [0, 0, 0, data] }
  end
end
