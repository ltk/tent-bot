require_relative "base"

class Replay < BaseCommand
  def initialize(steps)
    @steps = steps
  end

  def update_history(history)
    validate_non_negative_argument(steps)
    validate_sufficient_action_count(history, steps)

    history.last(steps).each do |action|
      history.push(action)
    end
    history
  end

  private

  attr_reader :steps
end
