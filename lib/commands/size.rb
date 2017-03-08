require_relative "base"

class Size < BaseCommand
  def initialize(new_size)
    @new_size = new_size
  end

  def update_history(history)
    history.push(self)
  end

  def update_slots(slots)
    validate_non_negative_argument(new_size)

    (0..new_size - 1).inject(Array(slots).slice(0, new_size)) do |slots, index|
      slots[index] ||= 0
      slots
    end
  end

  private

  attr_reader :new_size
end
