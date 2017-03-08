# TentBot

## Assumptions
- Meta-commands like Undo and Replay cannot be acted upon by other meta-commands. (i.e. A command sequence of `undo 1` `undo 1` will not cause the first `undo` to be undone.) This behavior is fun to think about, but functions extremely unintuitively.
- The program should try to recover from small input errors wherever possible. (e.g. extra spaces before/after commands)
- Users should be shown helpful error messages in the event of any input error.
- Extensibility is more important than pure performance.

## To Run
- Install Ruby 2.4
- `ruby run.rb`

## To Quit
Enter the command `quit`

## To Test
`ruby test.rb`

These tests are very basic; I would have loved to add a more comprehensive test suite given more time!
