# frozen_string_literal: true

# Emulator
# The Emulator module serves as an interface for emulation classes.
# Classes including this module must implement the `start` method.
module Emulator
  # @abstract
  # Starts the emulator.
  # This method must be implemented by subclasses.
  #
  # @raise [NotImplementedError] if the method is not implemented by a subclass
  def start
    raise NotImplementedError, 'Subclasses must implement this method'
  end
end
