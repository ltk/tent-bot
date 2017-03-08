class Input
  def self.register_command(klass, command)
    registered_commands[command] = klass
  end

  def self.registered_commands
    @registered_commands ||= {}
  end

  def initialize
    prompt
    @raw_input = gets
  end

  def action
    action_class.validate_arity(arguments)
    action_class.new(*arguments)
  end

  private

  def action_class
    self.class.registered_commands[command] || raise(CommandError.new("Unknown command `#{command}`"))
  end

  def command
    segments[0]
  end

  def arguments
    segments[1..3].map do |argument|
      Integer(argument)
    end
  rescue ArgumentError
    raise CommandError.new("All command arguments must be numeric.")
  end

  def segments
    @segments ||= Array(raw_input.strip.split(/\s+/))
  end

  attr_reader :raw_input

  def prompt
    print "> "
  end
end
