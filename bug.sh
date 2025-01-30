#!/bin/bash

# This script demonstrates a race condition bug.

count=0

# Function to increment the counter
increment_counter() {
  local new_count=$((count + 1))
  count=$new_count
}

# Create two processes that increment the counter simultaneously
increment_counter &
increment_counter &

# Wait for both processes to finish
wait

# Print the final count
echo "Final count: $count"