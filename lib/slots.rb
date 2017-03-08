class Slots
  def initialize(history)
    @history = history
  end

  def state
    @state ||= history.inject(nil) do |slots, action|
      action.update_slots(slots)
    end
  end

  attr_reader :history
end
