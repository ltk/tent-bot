unless RUBY_VERSION =~ /2.4.+/
  puts "Warning: Ruby 2.4 is recommended. Currently running Ruby #{RUBY_VERSION}."
end

Dir["./lib/*.rb"].each       { |file| require file }
Dir["./lib/commands/*"].each { |file| require file }
Dir["./lib/errors/*"].each   { |file| require file }

Input.register_command(Size,   "size")
Input.register_command(Add,    "add")
Input.register_command(Move,   "mv")
Input.register_command(Remove, "rm")
Input.register_command(Undo,   "undo")
Input.register_command(Replay, "replay")
Input.register_command(Quit,   "quit")

Program.new.start
