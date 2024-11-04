# The code provided by user is a module with a method which raises NotImplementedError
# This can be considered as an way to define an 'interface' in Ruby, where subclasses are expected to implement 'start' method.
# However, there's no specific implementation in the code, so most appropriate test would be whether calling that method raises an NotImplementedError

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