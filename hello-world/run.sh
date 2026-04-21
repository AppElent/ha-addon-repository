#!/usr/bin/env bashio

bashio::log.info "Hello World add-on starting..."
bashio::log.info "The /hello binary will print a message and the container will exit."

exec /hello
