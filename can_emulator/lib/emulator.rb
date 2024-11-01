class Emulator
  def initialize
    raise 'Emulator is an abstract base class and cannot be instantiated directly.'
  end

  # Define any shared methods here, if needed
  def start
    puts 'Starting Emulator'
  end

  def send_can_message
    puts 'Sending Can Message'
  end
end
