# Home Assistant add-on: Cloudflared HTTP2
ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:latest
FROM ${BUILD_FROM}

# Labels
LABEL io.hass.name="Cloudflared HTTP2" \
      io.hass.description="Cloudflare Tunnel with forced HTTP/2" \
      io.hass.version="1.0.0" \
      io.hass.type="addon" \
      io.hass.arch="amd64"

# Install cloudflared
RUN apk add --no-cache curl ca-certificates \
    && curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 \
       -o /usr/local/bin/cloudflared \
    && chmod +x /usr/local/bin/cloudflared

# Copy run script (we'll add it later if needed)
# COPY run.sh /usr/local/bin/run.sh
# RUN chmod +x /usr/local/bin/run.sh

# Set defaults
ENV TUNNEL_NAME="fazenga_tunnel"

# Force HTTP/2 by disabling HTTP/3 (quic) and h2c off
CMD ["/usr/local/bin/cloudflared", "tunnel", "--no-autoupdate", "--protocol", "h2", "run", "--name", "${TUNNEL_NAME}"]
