# can_socket_spec.rb
# frozen_string_literal: true

require 'rspec'
require_relative '../../lib/can_socket'

RSpec.describe CanSocket do
  let(:interface) { 'can0' }
  let(:socket) { described_class.new(interface) }

  let(:message) do
    {
      id: 0x123,
      data: [0xDE, 0xAD, 0xBE, 0xEF],
      hex_id: '123',
      hex_data: 'DEADBEEF'
    }
  end

  before do
    allow(socket).to receive(:system).and_return(true)
  end

  describe '#initialize' do
    it 'sets the interface instance variable' do
      expect(socket.instance_variable_get(:@interface)).to eq(interface)
    end
  end

  describe '#send_message' do
    let(:command) { "cansend #{interface} #{message[:hex_id]}##{message[:hex_data]}" }

    it 'returns true when message is sent' do
      expect(socket.send_message(message[:id], message[:data])).to be true
    end

    it 'calls system with the correct command' do
      socket.send_message(message[:id], message[:data])
      expect(socket).to have_received(:system).with(command)
    end
  end
end
