require_relative "base"

class Move < BaseCommand
  def self.arity
    2
  end

  def initialize(from_slot, to_slot)
    @from_slot_index = from_slot - 1
    @to_slot_index = to_slot - 1
  end

  def update_history(history)
    history.push(self)
  end

  def update_slots(slots)
    validate_block_exists(slots, from_slot_index)
    validate_slot_exists(slots, to_slot_index)

    slots[from_slot_index] -= 1
    slots[to_slot_index] += 1
    slots
  end

  private

  attr_reader :from_slot_index, :to_slot_index
end
