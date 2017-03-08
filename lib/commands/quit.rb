require_relative "base"

class Quit < BaseCommand
  def self.arity
    0
  end

  def update_program(program)
    program.stop
    puts "Goodbye!"
    puts "Final state is:"
  end
end
