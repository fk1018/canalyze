# frozen_string_literal: true

# j1939_emulator_spec.rb
require 'rspec'
require 'spec_helper'
require_relative '../../lib/j1939_emulator'

describe J1939Emulator do
  let(:emulator_instance) { described_class.new }

  describe '#initialize' do
    it 'creates an instance without error' do
      expect { emulator_instance }.not_to raise_error
    end

    it 'returns nil' do
      expect(emulator_instance).to be_an_instance_of(described_class)
    end
  end
end
