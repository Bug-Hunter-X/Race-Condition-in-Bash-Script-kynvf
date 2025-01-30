#!/bin/bash

# This script demonstrates a solution to the race condition bug using a lock file.

count=0
lock_file="count.lock"

# Function to increment the counter using a lock file
increment_counter() {
  # Acquire lock
  while flock -n -x "$lock_file"; do
  #Do nothing, keep trying
done

  local new_count=$((count + 1))
  count=$new_count
  echo "Counter updated: $count" > count.txt

  # Release lock
flock -u "$lock_file"
}

# Create two processes that increment the counter simultaneously
increment_counter &
increment_counter &

# Wait for both processes to finish
wait

# Print the final count
echo "Final count: $count"