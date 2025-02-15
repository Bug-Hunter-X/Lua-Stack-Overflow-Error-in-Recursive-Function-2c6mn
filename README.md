# Lua Stack Overflow Bug

This repository demonstrates a common error in Lua: a stack overflow caused by recursively traversing a deeply nested table.

## Bug Description
The `foo` function recursively iterates through a table.  If the table is too deeply nested, this can lead to a stack overflow error, as Lua's call stack has a limited size.

## How to Reproduce
1. Clone this repository.
2. Run `bug.lua`.

## Solution
The solution involves using iteration instead of recursion to avoid the stack overflow.

See `bugSolution.lua` for the corrected code.