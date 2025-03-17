# n8n Workflows

This directory contains configuration and documentation for n8n workflows used with Yaama Tech.

## Setup Information

- **n8n Instance**: https://yaama.app.n8n.cloud
- **API Key**: Configured in .env file
- **MCP Server**: Installed globally via npm

## Overview

The n8n-mcp-server is a Model Context Protocol (MCP) server that allows AI assistants to interact with n8n workflows through natural language. It provides tools and resources for AI assistants to manage n8n workflows and executions, allowing them to:

* List, create, update, and delete workflows
* Activate and deactivate workflows
* Execute workflows and monitor their status
* Access workflow information and execution statistics

## Getting Started

1. Make sure the environment variables are set in the `.env` file:
   ```
   N8N_API_URL=https://yaama.app.n8n.cloud/api/v1
   N8N_API_KEY=your-api-key
   DEBUG=true
   ```

2. Start the n8n-mcp-server:
   ```
   ./start-mcp-server.sh
   ```

## Available Tools

The server provides the following tools:

### Workflow Management

* `workflow_list`: List all workflows
* `workflow_get`: Get details of a specific workflow
* `workflow_create`: Create a new workflow
* `workflow_update`: Update an existing workflow
* `workflow_delete`: Delete a workflow
* `workflow_activate`: Activate a workflow
* `workflow_deactivate`: Deactivate a workflow

### Execution Management

* `execution_run`: Execute a workflow
* `execution_get`: Get details of a specific execution
* `execution_list`: List executions for a workflow
* `execution_stop`: Stop a running execution

## Resources

The server provides the following resources:

* `n8n://workflows/list`: List of all workflows
* `n8n://workflow/{id}`: Details of a specific workflow
* `n8n://executions/{workflowId}`: List of executions for a workflow
* `n8n://execution/{id}`: Details of a specific execution

## Workflows

- **[Yaama - Recruitment] Test Workflow**: A simple candidate application workflow with webhook trigger

## Useful Commands

- Check workflow status: `curl -H "X-N8N-API-KEY: $N8N_API_KEY" https://yaama.app.n8n.cloud/api/v1/workflows`
- Create a new workflow: `curl -X POST -H "X-N8N-API-KEY: $N8N_API_KEY" -H "Content-Type: application/json" -d '{"name":"Workflow Name","nodes":[],"connections":{},"settings":{"executionOrder":"v1"}}' https://yaama.app.n8n.cloud/api/v1/workflows`
- Activate a workflow: `curl -X POST -H "X-N8N-API-KEY: $N8N_API_KEY" https://yaama.app.n8n.cloud/api/v1/workflows/{workflowId}/activate`

## Integrating with AI Assistants

To use this MCP server with AI assistants, you need to register it with your AI assistant platform. The exact method depends on the platform you're using.

For example, with the MCP installer:

```
npx @anaisbetts/mcp-installer
```

Then register the server:

```
install_local_mcp_server path/to/n8n-mcp-server
```