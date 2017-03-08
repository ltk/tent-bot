class BaseCommand
  def self.arity
    1
  end

  def self.validate_arity(arguments)
    if arguments.count != arity
      raise CommandError.new("Wrong number of arguments for command. Expected #{arity}. Got #{arguments.count}.")
    end
  end

  def update_history(history)
    # Default to no operation
    history
  end

  def update_program(program)
    # Default to no operation
    program
  end

  def update_slots(slots)
    # Default to no operation
    slots
  end

  def validate_sufficient_action_count(history, steps)
    if history.actions.count < steps
      raise CommandError.new("The number of actions performed is lower than the number of actions you requested to modify.")
    end
  end

  def validate_slots_exist(slots)
    if !slots || slots.empty?
      raise CommandError.new("You must sufficiently size the slots before running other commands. (e.g. `size 4`)")
    end
  end

  def validate_slot_exists(slots, slot_index)
    validate_slots_exist(slots)

    if !slots[slot_index]
      raise CommandError.new("The number of allocated slots is too small for the given command. Run `size #{slot_index + 1}`, then rerun this command.")
    end
  end

  def validate_block_exists(slots, slot_index)
    validate_slot_exists(slots, slot_index)

    if slots[slot_index] < 1
      raise CommandError.new("No block exists at slot #{slot_index + 1}.")
    end
  end

  def validate_non_negative_argument(argument)
    if argument < 0
      raise CommandError.new("Command argument cannot be negative.")
    end
  end
end
