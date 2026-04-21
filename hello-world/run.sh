#!/usr/bin/env bashio

# Get configuration
LOG_LEVEL=$(bashio::config 'log_level')

# Run the echo server
bashio::log.info "Starting Echo Server on port 8080..."

exec /echo-server
