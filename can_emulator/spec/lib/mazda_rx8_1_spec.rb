# frozen_string_literal: true

# mazda_rx8_1_emulator_spec.rb
require 'rspec'
require 'spec_helper'
require_relative '../../lib/mazda_rx8_1'

describe MazdaRx81Emulator do
  let(:emulator_instance) { described_class.new }

  describe '#initialize' do
    it 'creates an instance without error' do
      expect { emulator_instance }.not_to raise_error
    end

    it 'returns nil' do
      expect(emulator_instance).to be_an_instance_of(described_class)
    end
  end

  describe '#start' do
    it 'should print starting message' do
      obj = MazdaRx81Emulator.new
      expect { obj.start }.to output("Starting MazdaRx81Emulator\n").to_stdout
    end
  end
end
