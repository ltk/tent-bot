require 'forwardable'

class History
  extend Forwardable

  attr_reader :current_state

  def_delegator :actions, :inject
  def_delegator :actions, :last

  def initialize
    @committed_actions = []
    @pending_actions = []
    @current_state = nil
  end

  def actions
    committed_actions + pending_actions
  end

  def push(action)
    pending_actions.push(action)
    self.current_state = Slots.new(self).state
    commit
  rescue CommandError => error
    rollback
    raise error
  end

  def pop
    # All sequential committed states are valid,
    # so no error handling is needed here.
    committed_actions.pop.tap do |last_action|
      self.current_state = Slots.new(self).state
    end
  end

  def commit
    self.committed_actions = committed_actions + pending_actions
    self.pending_actions = []
  end

  def rollback
    self.pending_actions = []
  end

  private

  attr_accessor :committed_actions, :pending_actions
  attr_writer :current_state
end
