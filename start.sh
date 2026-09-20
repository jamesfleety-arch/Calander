#!/bin/bash
# Start the Jotty Calendar app on port 8080
# Usage: ./start.sh
set -euo pipefail

PORT="${PORT:-8080}"
DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Starting Jotty Calendar on http://0.0.0.0:${PORT}"
cd "$DIR"
exec python3 -m http.server "$PORT" --bind 0.0.0.0
