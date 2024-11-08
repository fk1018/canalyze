# frozen_string_literal: true

# spec/mazda_rx8_emulator_spec.rb
require_relative '../../lib/mazda_rx8_emulator'

RSpec.describe MazdaRx8Emulator do
  let(:emulator) { described_class.new }

  describe 'random data generation methods' do
    it 'generates a random RPM within the expected range' do
      rpm = emulator.send(:random_rpm)
      expect(rpm).to be_between(800, 7000)
    end

    it 'generates a random speed within the expected range' do
      speed = emulator.send(:random_speed)
      expect(speed).to be_between(0, 120)
    end

    it 'generates a random throttle position within the expected range' do
      throttle = emulator.send(:random_throttle)
      expect(throttle).to be_between(0, 100)
    end

    it 'generates a random check engine light status as a boolean' do
      status = emulator.send(:check_engine_light_status)
      expected = [true, false]
      expect(expected).to include(status)
    end

    it 'generates a random transmission type as manual or automatic' do
      transmission = emulator.send(:transmission_type)
      expected = %w[manual automatic]
      expect(expected).to include(transmission)
    end

    it 'generates a random oil pressure status as a boolean' do
      pressure_status = emulator.send(:oil_pressure_status)
      expected = [true, false]
      expect(expected).to include(pressure_status)
    end
  end
end
