require_relative "base"

class Add < BaseCommand
  def initialize(slot)
    @slot_index = slot - 1
  end

  def update_history(history)
    history.push(self)
  end

  def update_slots(slots)
    validate_slot_exists(slots, slot_index)

    slots[slot_index] = slots[slot_index] + 1
    slots
  end

  private

  attr_reader :slot_index
end
