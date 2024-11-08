# mazda_rx8_emulator.rb
# frozen_string_literal: true

require_relative 'mazda_rx8_message_generator'
require_relative '../../can_socket/can_socket'

# MazdaRx8Emulator
class MazdaRx8Emulator
  def initialize
    @message_generator = MazdaRx8MessageGenerator.new
    @can_socket = CanSocket.new('vcan0')
  end

  def start
    puts 'Starting Mazda RX-8 CAN Emulator...'
    loop do
      generate_and_send_messages
      sleep(1)
    end
  end

  private

  def generate_and_send_messages
    messages = {
      indicator_lights: @message_generator.indicator_lights_message,
      engine_rpm: @message_generator.engine_rpm_message(random_rpm),
      throttle_position: @message_generator.throttle_position_message(random_throttle),
      check_engine_light: @message_generator.check_engine_light_message(check_engine_light_status),
      vehicle_speed: @message_generator.vehicle_speed_message(random_speed),
      transmission: @message_generator.transmission_message(transmission_type),
      oil_pressure: @message_generator.oil_pressure_message(oil_pressure_status)
    }

    messages.each_value { |message| send_can_message(message) }
  end

  def send_can_message(message)
    puts "Sending message with ID: #{message[:id]}, Data: #{message[:data].inspect}"
    @can_socket.send_message(message[:id], message[:data])
  end

  def random_rpm
    rand(800..7000)
  end

  def random_speed
    rand(0..120)
  end

  def random_throttle
    rand(0..100)
  end

  def check_engine_light_status
    [true, false].sample
  end

  def transmission_type
    %w[manual automatic].sample
  end

  def oil_pressure_status
    [true, false].sample
  end
end
