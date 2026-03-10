#!/bin/bash
# Post-edit hook: runs after Write or Edit tool calls
# Add project-specific post-edit actions here (formatting, linting, etc.)
#
# Examples:
#   npx prettier --write "$FILE_PATH"
#   npx eslint --fix "$FILE_PATH"
#
# This hook receives tool input as JSON on stdin.
# Exit 0 to allow, exit 2 to block (with stderr as feedback).

# Currently a no-op — customize per project
exit 0
