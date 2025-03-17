#!/bin/bash

# Change to the n8n-workflows directory
cd "$(dirname "$0")"

# Load environment variables from .env file
export $(grep -v '^#' .env | xargs)

# Start the n8n-mcp-server
echo "Starting n8n MCP Server with environment from $(pwd)/.env"
n8n-mcp-server