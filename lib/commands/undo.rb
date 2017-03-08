require_relative "base"

class Undo < BaseCommand
  def initialize(steps)
    @steps = Integer(steps)
  end

  def update_history(history)
    validate_non_negative_argument(steps)
    validate_sufficient_action_count(history, steps)

    steps.times { history.pop }
    history
  end

  private

  attr_reader :steps
end
