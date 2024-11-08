# mazda_rx8_message_generator.rb
# frozen_string_literal: true

require_relative 'mazda_rx8_message_definitions'

# MazdaRx8MessageGenerator
class MazdaRx8MessageGenerator
  include MazdaRx8MessageDefinitions

  def indicator_lights_message
    { id: MESSAGE_ID_INDICATOR_LIGHTS, data: [0x40] }
  end

  def engine_rpm_message(rpm)
    raw_data = (rpm / 3.85).to_i
    { id: MESSAGE_ID_ENGINE_RPM, data: [raw_data >> 8, raw_data & 0xFF] }
  end

  def throttle_position_message(position_percent)
    raw_data = (position_percent * 2.5).to_i
    { id: MESSAGE_ID_THROTTLE, data: [raw_data] }
  end

  def check_engine_light_message(on)
    data = on ? 0x80 : 0x00
    { id: MESSAGE_ID_WARNINGS, data: [data] }
  end

  def vehicle_speed_message(kph)
    raw_speed = (kph * 100).to_i
    { id: MESSAGE_ID_SPEED, data: [raw_speed >> 8, raw_speed & 0xFF] }
  end

  def transmission_message(transmission_type)
    transmission_data = transmission_type == 'manual' ? 0x08 : 0x02
    wheel_size_data = 0x106
    { id: MESSAGE_ID_TRANSMISSION, data: [transmission_data, wheel_size_data] }
  end

  def oil_pressure_message(pressure_ok)
    data = pressure_ok ? 0x01 : 0x00
    { id: MESSAGE_ID_OIL_PRESSURE, data: [data] }
  end
end
