# spec/mazda_rx8_message_generator_spec.rb
# frozen_string_literal: true

require_relative '../../lib/mazda_rx8_message_generator'

RSpec.describe MazdaRx8MessageGenerator do
  let(:generator) { described_class.new }

  describe '#indicator_lights_message' do
    let(:message) { generator.indicator_lights_message }

    it 'has the correct id for indicator lights' do
      expect(message[:id]).to eq(0x650)
    end

    it 'has data as an array for indicator lights' do
      expect(message[:data]).to be_an(Array)
    end

    it 'has the correct data value for green indicator light' do
      expect(message[:data]).to eq([0x40]) # Assuming 0x40 for green light as in the example
    end
  end

  describe '#engine_rpm_message' do
    let(:message) { generator.engine_rpm_message(3000) }

    it 'has the correct id for engine RPM' do
      expect(message[:id]).to eq(0x201)
    end

    it 'splits RPM data into two bytes' do
      expect(message[:data].size).to eq(2)
    end

    it 'calculates the correct RPM byte values' do
      expected_value = (3000 / 3.85).to_i
      expect(message[:data]).to eq([expected_value >> 8, expected_value & 0xFF])
    end
  end

  describe '#throttle_position_message' do
    let(:message) { generator.throttle_position_message(50) }

    it 'has the correct id for throttle position' do
      expect(message[:id]).to eq(0x201)
    end

    it 'has seven bytes with the throttle position in the correct byte' do
      expect(message[:data].size).to eq(7)
      expect(message[:data][6]).to eq((50 * 2.5).to_i)
    end
  end

  describe '#check_engine_light_message' do
    it 'sets the correct id for check engine light' do
      message = generator.check_engine_light_message(true)
      expect(message[:id]).to eq(0x420)
    end

    it 'sets the correct data when the check engine light is on' do
      message = generator.check_engine_light_message(true)
      expect(message[:data]).to eq([0, 0, 0, 0, 0x80])  # Check Engine Light on (Bit 7)
    end

    it 'sets the correct data when the check engine light is off' do
      message = generator.check_engine_light_message(false)
      expect(message[:data]).to eq([0, 0, 0, 0, 0x00])  # Check Engine Light off
    end
  end

  describe '#vehicle_speed_message' do
    let(:message) { generator.vehicle_speed_message(80) }

    it 'has the correct id for vehicle speed' do
      expect(message[:id]).to eq(0x201)
    end

    it 'has six bytes with vehicle speed in the correct bytes' do
      expect(message[:data].size).to eq(6)
      expected_speed = ((80 * 100) + 10_000).to_i
      expect(message[:data][4..5]).to eq([expected_speed >> 8, expected_speed & 0xFF])
    end
  end

  describe '#transmission_message' do
    it 'sets the correct id for transmission type' do
      message = generator.transmission_message('manual')
      expect(message[:id]).to eq(0x630)
    end

    it 'sets data correctly for manual transmission' do
      message = generator.transmission_message('manual')
      expect(message[:data]).to eq([0x08, 0x6A])  # 0x08 for manual, 0x6A for wheel size
    end

    it 'sets data correctly for automatic transmission' do
      message = generator.transmission_message('automatic')
      expect(message[:data]).to eq([0x02, 0x6A])  # 0x02 for automatic, 0x6A for wheel size
    end
  end

  describe '#oil_pressure_message' do
    it 'sets the correct id for oil pressure' do
      message = generator.oil_pressure_message(true)
      expect(message[:id]).to eq(0x420)
    end

    it 'sets the correct data when oil pressure is OK' do
      message = generator.oil_pressure_message(true)
      expect(message[:data]).to eq([0, 0, 0, 0x01])  # Oil pressure OK
    end

    it 'sets the correct data when oil pressure is not OK' do
      message = generator.oil_pressure_message(false)
      expect(message[:data]).to eq([0, 0, 0, 0x00])  # Oil pressure not OK
    end
  end
end
