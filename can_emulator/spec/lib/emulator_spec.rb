# frozen_string_literal: true

require 'rspec'
require 'spec_helper'
require_relative '../../lib/emulator'

class DummyClass
  include Emulator
end

describe Emulator do
  let(:dummy) { DummyClass.new }

  describe '#start' do
    it 'raises NotImplementedError when not implemented by subclasses' do
      expect { dummy.start }.to raise_error(NotImplementedError)
    end
  end
end
