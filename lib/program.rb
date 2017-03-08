class Program
  attr_accessor :running

  def initialize
    @history = History.new
  end

  def start
    self.running = true
    puts "Welcome to TentBot! Enter your command to start stacking tents:"
    loop while self.running
  end

  def stop
    self.running = false
  end

  private

  attr_reader :history

  def loop
    process(Input.new.action)
    puts OutputFormatter.new(history.current_state).to_s
  rescue CommandError => error
    puts "Error: #{error}"
  end

  def process(action)
    action.update_program(self)
    action.update_history(history)
  end
end
