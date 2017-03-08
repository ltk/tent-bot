require "test/unit"
require "test/unit/ui/console/testrunner"

Dir["./lib/*.rb"].each       { |file| require file }
Dir["./lib/commands/*"].each { |file| require file }
Dir["./lib/errors/*"].each   { |file| require file }

class CommandsTest < Test::Unit::TestCase
  def test_add_update_history
    add = Add.new(2)
    assert_equal(add.update_history([]), [add])
  end

  def test_add_update_slots
    add = Add.new(2)
    assert_equal(add.update_slots([1,2,1]), [1,3,1])
  end

  def test_move_update_history
    move = Move.new(1, 2)
    assert_equal(move.update_history([]), [move])
  end

  def test_move_update_slots
    move = Move.new(1, 2)
    assert_equal(move.update_slots([1,2,1]), [0,3,1])
  end

  def test_remove_update_history
    remove = Remove.new(2)
    assert_equal(remove.update_history([]), [remove])
  end

  def test_remove_update_slots
    remove = Remove.new(2)
    assert_equal(remove.update_slots([1,2,1]), [1,1,1])
  end

  def test_size_update_history
    size = Size.new(4)
    assert_equal(size.update_history([]), [size])
  end

  def test_size_update_slots
    size = Size.new(4)
    assert_equal(size.update_slots(nil), [0,0,0,0])
  end

  def test_undo_update_history
    history = History.new
    size = Size.new(2)
    history.push(size)
    history.push(Add.new(1))
    history.push(Add.new(2))
    undo = Undo.new(2)
    assert_equal(undo.update_history(history).current_state, [0,0])
  end

  def test_undo_update_slots
    undo = Undo.new(2)
    assert_equal(undo.update_slots([1,2,1]), [1,2,1])
  end

  def test_replay_update_history
    history = History.new
    size = Size.new(2)
    history.push(size)
    history.push(Add.new(1))
    history.push(Add.new(2))
    replay = Replay.new(2)
    assert_equal(replay.update_history(history).current_state, [2,2])
  end

  def test_replay_update_slots
    replay = Replay.new(2)
    assert_equal(replay.update_slots([1,2,1]), [1,2,1])
  end
end

Test::Unit::UI::Console::TestRunner.run(CommandsTest)
