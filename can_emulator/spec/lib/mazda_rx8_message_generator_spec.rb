# frozen_string_literal: true

# spec/mazda_rx8_message_generator_spec.rb
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
  end

  describe '#engine_rpm_message' do
    let(:message) { generator.engine_rpm_message(3000) }

    it 'has the correct id for engine RPM' do
      expect(message[:id]).to eq(0x201)
    end

    it 'splits RPM data into two bytes' do
      expect(message[:data].size).to eq(2)
    end
  end

  describe '#throttle_position_message' do
    let(:message) { generator.throttle_position_message(50) }

    it 'has the correct id for throttle position' do
      expect(message[:id]).to eq(0x201)
    end

    it 'represents throttle as a single byte' do
      expect(message[:data].size).to eq(1)
    end
  end

  describe '#check_engine_light_message' do
    it 'sets the correct data when the check engine light is on' do
      message = generator.check_engine_light_message(true)
      expect(message[:data]).to eq([0x80])
    end

    it 'sets the correct data when the check engine light is off' do
      message = generator.check_engine_light_message(false)
      expect(message[:data]).to eq([0x00])
    end
  end

  describe '#vehicle_speed_message' do
    let(:message) { generator.vehicle_speed_message(80) }

    it 'has the correct id for vehicle speed' do
      expect(message[:id]).to eq(0x4b1)
    end

    it 'splits vehicle speed data into two bytes' do
      expect(message[:data].size).to eq(2)
    end
  end
end
