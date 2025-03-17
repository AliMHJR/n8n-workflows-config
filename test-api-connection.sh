#!/bin/bash

# Change to the n8n-workflows directory
cd "$(dirname "$0")"

# Load environment variables from .env file
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
  echo "Loaded environment from $(pwd)/.env"
else
  echo "Error: .env file not found"
  exit 1
fi

# Test the API connection
echo "Testing connection to n8n API at $N8N_API_URL"
curl -s -H "X-N8N-API-KEY: $N8N_API_KEY" "$N8N_API_URL/workflows" | grep -o '"name":"[^"]*"'

echo ""
echo "If you see workflow names above, the connection is working!"