#!/usr/bin/with-contenv bashio

# Read the add-on option 'tunnel_name' from config.yaml via bashio
TUNNEL_NAME="$(bashio::config 'tunnel_name')"

if [ -z "${TUNNEL_NAME}" ]; then
  bashio::log.error "Option 'tunnel_name' is empty. Set it in the add-on configuration."
  exit 1
fi

bashio::log.info "Starting cloudflared tunnel: ${TUNNEL_NAME}"
exec cloudflared tunnel run "${TUNNEL_NAME}"
