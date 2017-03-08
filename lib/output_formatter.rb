class OutputFormatter
  def initialize(slots)
    @slots = slots
  end

  def to_s
    return "(Nothing)" if !slots

    return slots.each_with_index.map do |slot, index|
      "#{index + 1}: " + ("⛺️" * slot)
    end
  end

  private

  attr_reader :slots
end
