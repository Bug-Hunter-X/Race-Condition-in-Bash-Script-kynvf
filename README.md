# Race Condition in Bash Script

This repository demonstrates a race condition bug in a bash script.  Two processes attempt to increment a shared counter concurrently, resulting in an unreliable final count. The solution uses a locking mechanism to prevent this concurrency issue.